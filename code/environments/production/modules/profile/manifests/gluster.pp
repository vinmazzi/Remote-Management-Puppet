class profile::gluster {

  $peers = ['ren04box0.localdomain','ren05box0.localdomain']
  
  class { gluster::repo:
    version => '3.10',
  }
  
  class { gluster::install:
    server  => true,
    client  => true,
    repo    => true,
    version => '3.10.5-1.el7',
  }
  
  class { ::gluster::service:
    ensure => running,
  }

  $my_peer = delete($peers, $::fqdn)

  $query = ["from","facts", ["and", ["=", "name", "gluster_binary"],["=","certname","${my_peer[0]}"]]]

  $result = puppetdb_query($query)

  if ($result.length > 0) {
    $bricks = $peers.map | $brick | {
      "${brick}:/data/gluster/teste"
    }

    gluster::peer { $my_peer:
      pool    => 'production',
    }

    gluster::volume {'data':
      replica => $peers.length(),
      bricks  => $bricks,
      force   => 'true',
    }
 
    cs_primitive {'montagemFs':
      primitive_class => 'ocf',
      provided_by     => 'heartbeat',
      primitive_type  => 'Filesystem',
      parameters      => {
        'device'      => '192.168.122.222:/data',
        'directory'   => '/gluster/teste',
        'fstype'      => 'glusterfs',
      },
    }
    cs_primitive { 'nginx_docker':
      primitive_class => 'ocf',
      provided_by     => 'heartbeat',
      primitive_type  => 'docker',
      parameters      => {
        'image'       => 'docker.io/nginx',
        'run_opts'    => '-d -p 8080:80 -v /gluster/teste:/usr/share/nginx/html',
      },
    }
    cs_group { "Cluster":
      primitives => ['virtIP','montagemFs','nginx_docker'],
    }
  } 
}

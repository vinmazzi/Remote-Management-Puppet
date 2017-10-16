class profile::container {

  $docker_networks  = lookup('docker_networks')
  $docker_registries = lookup('registries')
  $docker_containers = lookup('containers')

  class {'docker':
    iptables       => false,
    manage_service => false,
  }

  cs_primitive { 'docker_service':
    ensure          => 'present',
    primitive_class => 'systemd',
    primitive_type  => 'docker',
    tag             => 'Docker_service',
  }

  $docker_registries.each | $reg | {
    mz::docker_registry { $reg[0]:
      * => $reg[1],
    }
  }

 
  docker::image {'ren3355box0.localdomain:5000/nginx': }

 
  $docker_networks.each | $dn | {
    docker_network { $dn[0]:
      * => $dn[1],
    }
  }

  $docker_containers.each | $dc | {
    mz::docker_container { $dc[0]:
      *   => $dc[1],
    }
  } 

  Cs_primitive['docker_service'] -> Mz::Docker_registry <| |> -> Docker::Image <| |> -> Mz::Docker_container<| |>
}

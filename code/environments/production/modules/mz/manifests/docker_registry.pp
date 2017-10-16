define mz::docker_registry (
  String $registry       = $name,
  String $docker_ssl_dir = "/etc/docker/certs.d/",
  String $user           = undef,
  String $password       = undef,
  String $email          = undef,
  String $ca_crt         = undef,
) {

  if ($ca_crt != undef) {
    [$docker_ssl_dir, "${docker_ssl_dir}/${registry}"].each | $dir |{
      file {$dir:
        ensure => directory,
      }
    }

    file { "${docker_ssl_dir}/${registry}/${registry}.crt":
      ensure  => 'file',
      content => "${ca_crt}\n",
    }
  }

  docker::registry {$registry:
    username  => $user,
    password  => $password,
    email     => $email,
  }
}

define mz::docker_container(
 String $network    = undef,
 String $image      = undef,
 String $ipaddress  = undef,
) {
  
  cs_primitive {$name:
    ensure          => 'present',
    primitive_class => 'ocf',
    provided_by     => 'heartbeat',
    primitive_type  => 'docker',
    parameters      => {
      'image'       => $image,
      'name'        => $name,
      'run_opts'    => "--network ${network} --ip ${ipaddress}",
    },
  }

}

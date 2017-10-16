class profile::activemq {

  class  { 'java':
    distribution => 'jdk',
    version      => 'latest',
  }

 ->

  class { 'activemq': } 

}

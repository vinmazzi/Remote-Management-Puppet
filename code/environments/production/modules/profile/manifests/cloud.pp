class profile::cloud {


  #notify {"teste": }
 # ec2_vpc { 'Teste-vpc':
 #   ensure     => present,
 #   region     => 'sa-east-1',
 #   cidr_block => '10.0.0.0/24',
 #   tags       => {
 #     tag_name => 'value',
 #   },
 # }

 # ec2_vpc_subnet { 'Teste-subnet':
 #   ensure                  => present,
 #   region                  => 'us-east-1',
 #   cidr_block              => '10.0.0.0/24',
 #   availability_zone       => 'sa-east-1a',
 #   map_public_ip_on_launch => true,
 #   vpc                     => 'Teste-vpc',
 #   tags                    => {
 #     tag_name => 'value',
 #   },
 # }

 # ec2_securitygroup { 'name-of-security-group':
 #   ensure      => present,
 #   region      => 'sa-east-1',
 #   vpc         => 'Teste-vpc',
 #   description => 'a description of the group',
 #   ingress     => [{
 #     protocol  => 'tcp',
 #     port      => 22,
 #     cidr      => '0.0.0.0/0',
 #   }],
 #   tags        => {
 #     tag_name  => 'value',
 #   },
 # }

  ec2_instance { 'teste':
    ensure            => running,
    region            => 'sa-east-1',
    image_id          => 'ami-01d3456d', # you need to select your own AMI
    instance_type     => 't2.micro',
    key_name          => 'vmazzi',
    subnet            => 'teste-subnet',
    security_groups   => ['default'],
    tags              => {
      tag_name => 'teste',
    },
  }

}

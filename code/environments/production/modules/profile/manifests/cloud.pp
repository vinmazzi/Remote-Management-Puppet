class profile::cloud {

 $clients = lookup('clients')
 $clients.each | $t | {
   $vpcs    = lookup("${t}:cloud:vpcs", Data, 'first',undef)
   $sgs     = lookup("${t}:cloud:sgs", Data, 'first',undef)
   $subnets = lookup("${t}:cloud:subnets", Data, 'first',undef)

   if ($vpcs != undef) {
     $vpcs.each | $vpc | {
       ec2_vpc { $vpc[0]:
         * => $vpc[1],
       }
     } 
   }

   if ($subnets != undef) {
     $subnets.each | $subnet | {
       ec2_vpc_subnet { $subnet[0]:
         * => $subnet[1],
       }
     } 
   }

   if ($sgs != undef) {
     $sgs.each | $sg | {
       ec2_securitygroup { $sg[0]:
         * => $sg[1],
       }
     } 
   }
 } 

 resources { ['ec2_securitygroup', 'ec2_vpc_subnet', 'ec2_vpc']:
   purge => 'true',
 }
}

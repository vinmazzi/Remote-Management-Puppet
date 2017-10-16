class profile::firewall {

  include firewall

  $firewall_rules = lookup("fwrules")
  #$teste = "{\"Teste Facter\": {\"source\": \"${facts['networking']['interfaces']['eth0']['ip']}\", \"proto\": \"tcp\", \"chain\": \"POSTROUTING\", \"action\": \"accept\", \"table\": \"nat\", \"dport\": 223}}"

   $firewall_rules.each | $fw | {
      firewall { "000 ${fw[0]}":
        *       => $fw[1],
        require => Network_config['eth1'],
      }
   }

   $default_chains = {
    'filter'    => {
       'INPUT'          => ['IPv4','IPv6', 'ethernet'],
       'INPUT_direct'   => ['ethernet'],
       'OUTPUT'         => ['IPv4','IPv6', 'ethernet'],
       'OUTPUT_direct'  => ['ethernet'],
       'FORWARD'        => ['IPv4','IPv6', 'ethernet'],
       'FORWARD_direct' => ['ethernet'],
     },
    'nat'       => {
      'PREROUTING'         => ['IPv4','IPv6', 'ethernet'],
      'PREROUTING_direct'  => ['ethernet'],
      'INPUT'              => ['IPv4', 'IPv6'],
      'INPUT_direct'       => ['ethernet'],
      'OUTPUT'             => ['IPv4','IPv6', 'ethernet'],
      'OUTPUT_direct'      => ['ethernet'],
      'POSTROUTING'        => ['IPv4','IPv6', 'ethernet'],
      'POSTROUTING_direct' => ['ethernet'],
     },
    'mangle'   => {
      'PREROUTING'  => ['IPv4', 'IPv6'],
      'INPUT'       => ['IPv4', 'IPv6'],
      'OUTPUT'      => ['IPv4', 'IPv6'],
      'FORWARD'     => ['IPv4', 'IPv6'],
      'POSTROUTING' => ['IPv4', 'IPv6'],
     },
    'raw'       => {
      'PREROUTING' => ['IPv4', 'IPv6'],
      'OUTPUT'     => ['IPv4', 'IPv6'],
     },
    'security'  => {
      'INPUT'     => ['IPv4', 'IPv6'],
      'FORWARD'   => ['IPv4', 'IPv6'],
      'OUTPUT'    => ['IPv4', 'IPv6'],
     },
    'broute'    => {
      'BROUTING'        => ['ethernet'],
      'BROUTING_direct' => ['ethernet'],
    }
   }
   
   $default_chains.keys.each | $k | {
     $default_chains[$k].keys.each | $c | {
       $default_chains[$k][$c].each | $p | {
         if ($p == "ethernet") and ("_direct" in $c) {
           $policy = "return"
         } else {
           $policy = "accept"
         }
         firewallchain { "${c}:${k}:${p}":
           policy => $policy,
         }
       }
     }
   }

   resources {'firewall':
     purge => true,
   }

   resources { 'firewallchain':
     purge => true,
   }
}

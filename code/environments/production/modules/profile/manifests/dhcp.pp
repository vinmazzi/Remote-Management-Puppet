class profile::dhcp {

  $dhcp_service = lookup('dhcp_service', Data, 'first',undef)
  $dhcp_pools = lookup('dhcp_pools', Data, 'first',undef)

  if($dhcp_service != undef and $dhcp_pools != undef){
    class {'dhcp':
      * => $dhcp_service,
    }
    $dhcp_pools.each | $pool | {
      dhcp::pool { $pool[0]:
        * => $pool[1],
      }
    }
  }
  
}

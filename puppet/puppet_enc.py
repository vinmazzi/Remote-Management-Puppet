#!//usr/bin/python3.6

import sys, redis, json

node_name = str(sys.argv[1].split('.')[0])

host_ip = "192.168.1.201"
tcp_port = 6379
key_name = "Renner:{}:group".format(node_name)

if node_name == "puppetserver":
   yaml_return = "---\n  classes:\n   - profile::cloud\n  environment: production"
   print(yaml_return)
else:
   try:
      rc = redis.StrictRedis(host=host_ip, port=tcp_port, db=0)
      my_group = str(rc.get(key_name),'utf-8')
      interfaces = json.loads(rc.get("Renner:{}:network_interfaces".format(node_name)))
      extra_opts = ""
      for iface in interfaces.keys():
         if(interfaces[iface]['method'] == 'static'):
      	   if "ipaddress" in interfaces[iface]:
                 ipaddr = interfaces[iface]['ipaddress']
                 ipaddr_split = ipaddr.split(".")
                 network = "{}.{}.{}.0".format(ipaddr_split[0],ipaddr_split[1],ipaddr_split[2])
                 extra_opts = extra_opts + "\n    {}_ipaddress: {}\n    {}_network: {}".format(iface, ipaddr, iface, network)
      
      yaml_return = "---\n  classes:\n   - role::{}\n  environment: production\n  parameters:\n    my_group: {} {}".format(my_group, my_group, extra_opts)
      print(yaml_return)
   except Exception as err:
      yaml_return = "---\n  classes:\n   - role::default\n  environment: production"
      print(yaml_return)

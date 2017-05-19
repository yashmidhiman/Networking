#!/bin/sh
sudo ovs-vsctl -- set Port s1-eth4 qos=@newqos -- \
--id=@newqos create QoS type=linux-htb other-config:max-rate=1000000000 queues=0=@q0,1=@q1,2=@q2 -- \
--id=@q0 create Queue other-config:min-rate=1000000000 other-config:max-rate=1000000000 -- \
--id=@q1 create Queue other-config:min-rate=512000000 other-config:max-rate=512000000 -- \
--id=@q2 create Queue other-config:min-rate=512000000 other-config:max-rate=512000000
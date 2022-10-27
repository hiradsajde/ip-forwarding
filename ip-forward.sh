read -p 'enter main server ip address : ' ipv4
read -p 'enter main server port number : ' port
sudo iptables -t nat -A PREROUTING -p udp --dport $port -j DNAT --to-destination $ipv4
sudo iptables -t nat -A PREROUTING -p tcp --dport  $port   -j DNAT --to-destination $ipv4
sudo iptables -t nat -A POSTROUTING -p udp -d $ipv4 --dport  $port  -j MASQUERADE
sudo iptables -t nat -A POSTROUTING -p tcp -d $ipv4 --dport  $port  -j MASQUERADE
sudo echo 1 >> /proc/sys/net/ipv4/ip_forward

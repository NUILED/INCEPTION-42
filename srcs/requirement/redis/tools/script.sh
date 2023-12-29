mkdir -p /run/openrc
touch /run/openrc/softwarelevl
rc-service redis start

redis-server  --protected-mode no
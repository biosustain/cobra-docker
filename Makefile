pull:
	-docker pull biosustain/cobra-notebook
	-docker pull jupyter/configurable-http-proxy
	-docker pull jupyter/tmpnb

start:
	-sh run_cobranb.sh

restart: nuke start

reroute:
	-iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to 8000

super-nuke: nuke
	-docker rmi biosustain/cobra-notebook

# Cleanup with fangs
nuke:
	-docker stop `docker ps -aq`
	-docker rm -fv `docker ps -aq`
	-docker images -q --filter "dangling=true" | xargs docker rmi

.PHONY: nuke

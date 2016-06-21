pull:
	-docker pull biosustain/cobra-notebook
	-docker pull jupyter/configurable-http-proxy
	-docker pull jupyter/tmpnb

super-nuke: nuke
	-docker rmi biosustain/cobra-notebook

# Cleanup with fangs
nuke:
	-docker stop `docker ps -aq`
	-docker rm -fv `docker ps -aq`
	-docker images -q --filter "dangling=true" | xargs docker rmi

.PHONY: nuke

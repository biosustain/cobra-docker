images: cobranb 

cobranb:
	docker build -t biosustain/cobranb . 

upload: images
	docker push biosustain/cobranb

super-nuke: nuke
	-docker rmi biosustain/cobranb

# Cleanup with fangs
nuke:
	-docker stop `docker ps -aq`
	-docker rm -fv `docker ps -aq`
	-docker images -q --filter "dangling=true" | xargs docker rmi

.PHONY: nuke

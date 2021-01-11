default: up

.PHONY: up
up:
	@echo Bringing docker containers online
	@echo
	@echo
	docker volume create --name=packagist-demo-drupal-data
	docker-compose up -d

.PHONY: down
down:
	@echo Stopping docker containers
	@echo
	@echo
	docker-compose down

.PHONY: rebuild
rebuild: 
	@echo Forcing a rebuild of docker containers
	@echo
	@echo
	docker-compose build

# the timing does not work from Makefile for some reason - cut and paste to bash
.PHONY: timedbuild
timedbuild:
	docker volume create packagist-demo-drupal-data
	gtime -f '%e Seconds ' make up

.PHONY: full_rebuild_cycle
full_rebuild_cycle:
	docker-compose down
	make blammo
	
	make timedbuild


.PHONY: shell
shell:
	@echo Connecting to local docker instance
	@echo
	@echo
	docker exec -it packagist-demo bash

.PHONY: rootshell
rootshell:
	@echo Connecting to ROOT SHELL on local docker instance
	@echo
	@echo
	docker exec -u root -it packagist-demo bash

.PHONY: blammo
blammo:
	@echo
	@echo
	@echo BLAM! BLAM! BLAM! BLAM! BLAM!
	@echo
	@echo
	docker-compose down
	
	docker image rm ised_packagist_demo_drupal 
	docker volume rm packagist-demo-drupal-data

.PHONY: portainer
portainer: 
	docker run -d -p 9000:9000 -p 8000:8000 --name portainer --restart always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer -H unix:///var/run/docker.sock
	#docker run -d -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer --admin-password='_8c7lRs263yJZ]m05tz*^X`(T-:OA1gf'
	# --admin-password='k37P*eMT6q&tOD_%uNH4=y+\KX:8J209'

portainer-reset:
	make down
	 docker run --rm -v portainer_data:/data portainer/helper-reset-password








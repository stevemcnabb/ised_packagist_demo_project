default: up

.PHONY: up
up:
	@echo Bringing docker containers online
	@echo
	@echo
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
	gtime make up

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
	docker image rm packagist-demo_drupal

.PHONY: portainer
portainer: 
	docker run -d -p 9000:9000 -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer 
	# --admin-password='k37P*eMT6q&tOD_%uNH4=y+\KX:8J209'









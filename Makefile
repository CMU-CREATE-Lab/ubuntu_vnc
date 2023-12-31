build:
	docker-compose build

up: build
	docker-compose up

down:
	docker-compose down

shell:
	docker exec -it $(shell docker ps -qf "name=ubuntu-vnc") bash

shell-rsargent:
	docker exec -it $(shell docker ps -qf "name=ubuntu-vnc") su --login rsargent

build:
	docker-compose build

up: build
	echo "Starting in detached mode, then watching logs for 5 seconds"
	docker-compose up -d
	timeout 5 docker-compose logs -f -t || exit 0
	echo "(Stopped watching logs after 5 seconds)"

down:
	docker-compose down

shell:
	docker exec -it $(shell docker ps -qf "name=ubuntu-vnc") bash

shell-rsargent:
	docker exec -it $(shell docker ps -qf "name=ubuntu-vnc") su --login rsargent

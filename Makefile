all:
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

re: clean
	docker-compose -f srcs/docker-compose.yml up -d --build

stop:
	docker-compose -f srcs/docker-compose.yml stop

clean:
	docker-compose -f srcs/docker-compose.yml stop
	docker system prune -af
	docker network prune -f
	docker volume prune -f

.PHONY: all re down stop clean
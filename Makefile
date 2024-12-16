all:
	docker-compose -f srcs/docker-compose.yml up -d --build

down:
	docker-compose -f srcs/docker-compose.yml down

re: clean
	docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f srcs/docker-compose.yml stop
	docker system prune -af

.PHONY: all re down clean
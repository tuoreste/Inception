# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otuyishi <otuyishi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/23 17:58:23 by otuyishi          #+#    #+#              #
#    Updated: 2024/06/13 13:03:09 by otuyishi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = docker compose -f /home/otuyishi/Inception/srcs/docker-compose.yml

all: up

#chown -R $(whoami):$(whoami) /home/otuyishi/data/wp
#chown -R $(whoami):$(whoami) /home/otuyishi/data/db

delete_volumes:
	@rm -rf $(WORDPRESS_DATA)
	@rm -rf $(MARIADB_DATA)

down:
	$(DOCKER_COMPOSE) down

start:
	$(DOCKER_COMPOSE) start

build:
	@echo "Build containers"
	$(DOCKER_COMPOSE) build

up: build
	@echo "Starting up containers"
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) stop

clean: down
	@echo "Removing docker containers, networks, and images created by up..."
	docker container prune -f
	docker network prune -f
	docker image prune -f

fclean: clean
	@echo "Removing all unused networks, and dangling images..."
	docker system prune -a -f

re: fclean all
	@echo "Rebuilding the project from scratch..."

.PHONY: all up down clean fclean re delete_volumes create_volumes start stop

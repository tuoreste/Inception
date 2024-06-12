# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otuyishi <otuyishi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/23 17:58:23 by otuyishi          #+#    #+#              #
#    Updated: 2024/06/12 13:28:05 by otuyishi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml

WORDPRESS_DATA = /Users/otuyishi/data/wordpress_data
MARIADB_DATA = /Users/otuyishi/data/mariadb_data

.PHONY: all build up down logs restart create_volumes delete_volumes

all: create_volumes up

create_volumes:
	@if [ ! -d $(WORDPRESS_DATA) ]; then \
		echo "Creating $(WORDPRESS_DATA)"; \
		mkdir -p $(WORDPRESS_DATA); \
	fi
	@if [ ! -d $(MARIADB_DATA) ]; then \
		echo "Creating $(MARIADB_DATA)"; \
		mkdir -p $(MARIADB_DATA); \
	fi

delete_volumes:
	@rm -rf $(WORDPRESS_DATA)
	@rm -rf $(MARIADB_DATA)

down:
	$(DOCKER_COMPOSE) down

start:
	$(DOCKER_COMPOSE) start

build: create_volumes
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

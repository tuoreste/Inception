# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otuyishi <otuyishi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/23 17:58:23 by otuyishi          #+#    #+#              #
#    Updated: 2024/05/31 19:16:41 by otuyishi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DOCKER_COMPOSE = docker compose -f ./srcs/docker-compose.yml

WORDPRESS_DATA = /home/otuyishi/data/wordpress_data

MARIADB_DATA = /home/otuyishi/data/mariadb_data

.PHONY: all build up down logs restart

all: up

create_volumes:
	@mkdir -p $(WORDPRESS_DATA)
	@mkdir -p $(MARIADB_DATA)

delete_volumes:
	@rm -rf $(WORDPRESS_DATA)
	@rm -rf $(MARIADB_DATA)

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

logs:
	$(DOCKER_COMPOSE) logs -f

restart:
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) up -d

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: otuyishi <otuyishi@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/05/23 17:58:23 by otuyishi          #+#    #+#              #
#    Updated: 2024/05/30 20:23:24 by otuyishi         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

.PHONY: build up down logs restart

all:
	cd ./srcs/ && docker compose up

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

restart:
	docker-compose down
	docker-compose up -d

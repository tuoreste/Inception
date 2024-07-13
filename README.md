# Inception

Welcome to the **Inception** project! This project involves containerizing three 
essential services using Docker: MariaDB, Nginx, and WordPress. We utilize Docker Compose to orchestrate these containers, 
ensuring they work seamlessly together. Volumes are used to ensure data persistence, and sensitive data is managed using a `.env` file.

## Project Structure
```
Inception/
├── .gitignore
├── License
├── Makefile
├── README
└── srcs/
    ├── docker-compose.yml
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   └── tools/
        │       ├── conf
        │       └── scripts
        ├── nginx/
        │   ├── Dockerfile
        │   └── tools/
        │       ├── conf
        │       └── scripts
        └── wordpress/
            ├── Dockerfile
            └── tools/
                ├── conf
                └── scripts
```
## Services

### 1. MariaDB
MariaDB is an open-source relational database management system. In this project, we containerize MariaDB to handle all database operations for our WordPress site. By using Docker, we ensure that the database service is isolated, scalable, and easy to manage.

### 2. Nginx
Nginx is a high-performance web server. It is used here as a reverse proxy server to manage incoming HTTP requests and route them to the appropriate service (WordPress in this case). Nginx ensures that our web service is fast, reliable, and secure.

### 3. WordPress
WordPress is a popular content management system (CMS). We containerize it to provide a robust platform for managing website content. By running WordPress in a container, we make it easy to deploy, scale, and maintain.

## Volumes

Volumes are crucial in this project to ensure that data persists even if the containers are stopped or removed. Each service uses volumes to store its data:

- **MariaDB**: Stores database files.
- **Nginx**: Stores configuration files and logs.
- **WordPress**: Stores uploaded files, themes, plugins, and configuration.

## Docker Compose

Docker Compose is used to manage the multi-container application. The `docker-compose.yml` file defines how the services interact, the networks they use, and the volumes they mount. This setup allows for easy orchestration of the containers, ensuring they work together as a cohesive application.

## Environment Variables

Sensitive data such as database passwords and user credentials are managed using a `.env` file. This file is not included in version control to keep sensitive information secure. The `.env` file provides an easy way to configure environment-specific variables without hardcoding them into the configuration files.

## Getting Started

To get started with the Inception project:

1. Clone the repository.
2. Create a `.env` file with the necessary environment variables(refer to docker-compose file for necessary variables).
3. Use Docker Compose to build and start the services:

## Recommendation For Intro to Docker Containerization and Kubernetes

1. ```www.udemy.com/course/docker-kubernetes-the-practical-guide```

## Conclusion

The Inception project demonstrates how to effectively containerize and manage a multi-service application using Docker and Docker Compose. By leveraging containers, we ensure that our application is easy to deploy, scale, and maintain, with persistent data storage and secure management of sensitive information.

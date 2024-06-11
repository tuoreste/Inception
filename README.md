# Inception Project: Multi-Container Setup with Nginx, MariaDB, and WordPress

(DRAFT)

## Overview

The Inception Project involves setting up a multi-container environment using Docker. The setup includes:

1. **Nginx Container**: Acts as a web server and reverse proxy.
2. **MariaDB Container**: Handles the database operations.
3. **WordPress Container**: Runs the WordPress site and connects to the MariaDB database.

This guide will walk you through the project structure, the necessary configurations, and instructions to set up and run the environment.

## Prerequisites

Before starting, ensure you have the following installed on your machine:

- Docker
- Docker Compose

## Project Structure

The project directory is organized as follows:

## Setup Details

### Nginx Container

- **Dockerfile**: Specifies the base image for Nginx and copies the configuration file into the container.
- **Configuration File**: Defines the server configuration, including the reverse proxy settings to forward requests to the WordPress container.

### MariaDB Container

- **Dockerfile**: Specifies the base image for MariaDB and sets environment variables for database configuration (root password, database name, user, and password).

### WordPress Container

- **Dockerfile**: Specifies the base image for WordPress.

### Docker Compose

The `docker-compose.yml` file orchestrates the multi-container setup, specifying how the services (nginx, mariadb, and wordpress) interact with each other, including dependencies, environment variables, and volume mappings.

## Instructions

### Clone the Repository

Begin by cloning the project repository from GitHub to your local machine:
-->project in progress



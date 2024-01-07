# Project Inception README

Overview
Project Inception is a complex assignment that requires setting up a small infrastructure using multiple services within Docker containers. This project must be executed on a Virtual Machine and involves configuring a network of containers to operate a web service. This README outlines the setup and structure required for the project.

Key Requirements
Virtual Machine: Entire project must be done on a Virtual Machine.
Source Code Management: All configuration files must be in a srcs folder.
Makefile: A Makefile at the root of your directory is required to set up the entire application, including building Docker images with docker-compose.yml.
Docker and Docker Compose: Deep understanding and application of Docker and Docker Compose is essential.
Custom Docker Images: You need to write your own Dockerfiles for each service and build them without using ready-made images (except for base Alpine/Debian images).
Services Setup: Implementation of multiple services including NGINX, WordPress + php-fpm, and MariaDB, each in separate Docker containers.
Volumes: Create volumes for WordPress database and website files.
Docker Network: Establish a network connection between your containers without using deprecated methods like network: host, --link, or links: in docker-compose.yml.
Security and Best Practices: Adhere to security best practices, such as no passwords in Dockerfiles and using environment variables (preferably stored in a .env file).
Directory Structure

/
├── Makefile
└── srcs 
    ├── docker-compose.yml
    ├── .env
    └── requirements
        ├── mariadb
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── ...
        ├── nginx
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── ...
        ├── wordpress
        │   ├── Dockerfile
        │   ├── .dockerignore
        │   └── ...
        └── ...

.env File Example
makefile

DOMAIN_NAME=wil.1337.ma
# Certificates Path
CERTS_=./path_to_certs
# MySQL Configuration
MYSQL_ROOT_PASSWORD = secret_root_password

MYSQL_USER=wordpress_user

MYSQL_PASSWORD=wordpress_password

# Other environment variables
...
Important Notes
Users in WordPress Database: Create at least two users, including an administrator without using 'admin/Admin' or 'administrator/Administrator' in the username.
Domain Configuration: Configure your domain (e.g., wil.42.fr) to point to your VM's local IP address.
Security: TLSv1.2 or TLSv1.3 must be used for NGINX, and it should be the only entry point into your infrastructure on port 443.
Container Management: Ensure containers are set to restart in case of a crash. Avoid using hacky patches for running containers indefinitely.
Documentation and Best Practices: Extensive reading and adherence to best practices for Docker and networking are advised.
Contribution
Fork the repository.
Create a feature branch (git checkout -b feature_branch).
Commit your changes (git commit -am 'Add some feature').
Push to the branch (git push origin feature_branch).
Create a new Pull Request.
This project is an advanced assignment requiring careful attention to detail and a strong understanding of Docker, container networking, and security best practices. Ensure you follow the specifications closely and validate each component of your infrastructure before submission.

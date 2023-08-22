# Nginx Repository

This repository contains the necessary files to create a reverse proxy using Nginx in a Docker environment. The reverse proxy enables routing of HTTPS connections and utilizes Let's Encrypt certificates to ensure security.

## Contents

The repository includes the following files:

- `docker-compose.yml`: The Docker Compose configuration file that defines the services and networks for the Nginx container.
- `Dockerfile`: The Dockerfile used to build the Nginx container image, with Certbot installed.
- `text.conf`: A sample Nginx configuration file that sets up a reverse proxy to `https://google.com` and includes some proxy headers.

## Prerequisites

Before using this repository, ensure that you have Docker and Docker Compose installed on your system.

`npx degit dariasmyr/nginx-proxy my-app`

## Configuration

To configure the Nginx container with HTTPS support for your specific host, follow these steps:

1. Create a `.cert` file for your host, using the example provided in `text.conf`. Modify the `server_name` directive to match your host.

2. Start the Docker container by running the following command:

   ```shell
   docker-compose up -d
   ```
3. Open a terminal inside the running container:
   ```shell
   docker-compose exec -it nginx bash
   ```
4. Once inside the container, run the Certbot command to obtain an SSL certificate:
   ```shell
   certbot --nginx
   ```
5. Follow the Certbot prompts to select the appropriate .conf file containing your host configuration.

6. Certbot will automatically configure Nginx with the obtained SSL certificate and update the Nginx configuration.

7. Restart the Nginx container to apply the changes:
   ```shell
   docker-compose restart nginx
   ```
## Customization
Feel free to modify the text.conf file according to your specific reverse proxy requirements. You can add or modify the proxy headers, change the target URL, or configure additional locations.

### Additional Resources
For more information on using Nginx and Certbot, refer to the following documentation:

**[Nginx Documentation](https://nginx.org/en/docs/)**

**[Certbot Documentation](https://eff-certbot.readthedocs.io/en/stable/)**

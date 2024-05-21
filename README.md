# Get started
## Preparation
1. Create directory `php-scripts` and move the php files there
2. Clone your backend and frontend files into `backend` and `frontend` directories
3. In `nginx/default.conf` replace `example.com` by your domain name
## Build and run with HTTPS
1. Disable/comment main server block in `default.conf`
2. Use `docker compose up -d --build`
3. Use `docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d example.com` to create certs
4. Enable/uncomment main server block in `default.conf`
5. Use `docker compose down` and then `docker compose up -d` to restart containers
## Utilities
### Clean
Run `cleanup_docker.sh` to delete all the Docker data
### HTTPS
Use `docker compose run --rm certbot renew` to renew certs

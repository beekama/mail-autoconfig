Mail Client Autoconfig
===
This project provides a Dockerized solution for creating a **Mail Autoconfiguration (Autoconfig)** system using **Automx2**. It allows to automatically configure email clients with the appropriate configuration for your mail server.

## Requirements
 * Docker
 * Docker Compose

## Setup
#### Clone Repository
   ```
    git clone https://github.com/yourusername/automx2-mail-autoconfig.git
    cd automx2-mail-autoconfig
   ```
#### Create Volume and set permissions
   ```
    sudo mkdir -p /data/automail-db
    sudo chown 1000:1000 automail-db
   ```
#### Customize `init.sql`
    Edit `init.sql` to configure your server settings (domain, perhabs also IMAP, SMTP settings).
    
#### Build and Run the Docker Container
    ```
    docker-compose build
    docker-compose up -d
    ```
#### Verify the Service
```
curl "http://localhost:4243/mail/config-v1.1.xml?emailaddress=test@YOURDOMAIN.COM"
```
## Implementation Note & Further Reading
This project is based on [Yannik's article](https://yannikschmidt.com/posts/automx/), which explains a **non-Docker version** of autoconfig.

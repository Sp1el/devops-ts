#!/bin/bash

DATE=$(date -u +"%Y-%m-%d_%H-%M-%S")

tar -czf /home/sp1el/devops-ts/backups/nginx_backup_$DATE.tar.gz /etc/nginx


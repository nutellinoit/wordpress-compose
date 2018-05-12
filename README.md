# Wordpress Docker Compose

## No Brain start


Create env file

```bash
./create_env.sh
```

Edit env file:

```bash

### wordpress host
HOST_HTTP_PORT=80

### wordpress info and backup filename
MYSQL_HOST=db
MYSQL_DATABASE=wordpress
MYSQL_USER=root
MYSQL_PASSWORD=34kml234m2l
MYSQL_SQL_FILENAME=backup

### backup cron schedule
SCHEDULE=0 * * * * *

### BACKUP CREDENTIALS
S3_UPLOAD=true
### S3 or minio host
S3_HOST=minio:9000
### Protocol
S3_PROTOCOL=http
### Your bucket name
S3_BUCKET=cicciopollo
### minio or s3 credentials
S3_KEY=85A8U57ZITLSLFBYKNCG
S3_SECRET=14MAuAetrv7y3E6zAuUOimXy5KYRqrZKw3cWuEe/
### port of local minio
MINIO_PORT=9000

### BACKUP DB ZIP FILE
ZIP_FILE=true

### BACKUP FOLDERS
FOLDERS=/var/www/html

```

Start wordpress

```bash
docker-compose up -d
```

## Backup 

Enable backup section on docker-compose.yml , S3 repository strongly recommended. More info on backups container here:

* [https://github.com/nutellinoit/sidecar-backup-volumes](https://github.com/nutellinoit/sidecar-backup-volumes)
* [https://github.com/nutellinoit/sidecar-backup-mysql](https://github.com/nutellinoit/sidecar-backup-mysql)

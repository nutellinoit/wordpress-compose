#!/usr/bin/env bash

echo "Launching wp-data backup.."
docker-compose exec sidecar-backup-volumes bash ./cron_script.sh
echo "Launching database backup.."
docker-compose exec sidecar-backup-mysql sh ./cron_script.sh

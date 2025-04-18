#!/bin/bash

Work_dir=/backup/grafana
# Find last backup
last_backup_file=`ls -1 $Work_dir | grep "backup_" | sort | tail -n 1`;
systemctl stop grafana-server.service
mv /var/lib/grafana/grafana.db /var/lib/grafana/grafana.db.bak
unzip $Work_dir'/'$last_backup_file -d /
chmod 640 /var/lib/grafana/grafana.db
chown grafana:grafana /var/lib/grafana/grafana.db
systemctl start grafana-server.service
echo -e '\e[1;32mGrafana restore is done!\e[1;m';

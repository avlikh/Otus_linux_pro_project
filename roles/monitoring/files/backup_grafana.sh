#!/bin/bash
DATE=`date +"%Y-%m-%d_%Hh-%Mm"`;
FILE=backup"_grafana_"$DATE".zip"
zip -r /backup/grafana/$FILE /var/lib/grafana/grafana.db
echo -e '\e[1;32mGrafana backup is done!\e[1;m';
echo -e 'File:\e[1;31m '$FILE'\e[1;m';
#backup rotation
find /backup/grafana -mtime +31 -exec rm {}  \;

#!/bin/bash
DATE=`date +"%Y-%m-%d_%Hh-%Mm"`;
FILE=backup"_www_"$DATE".zip"
zip -r /backup/www/$FILE /www/wordpress/*
echo -e '\e[1;32mWWW backup is done!\e[1;m';
echo -e 'File:\e[1;31m '$FILE'\e[1;m';
#backup rotation
find /backup/www -mtime +31 -exec rm {}  \;

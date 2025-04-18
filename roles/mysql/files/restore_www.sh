#!/bin/bash

Work_dir=/backup/www
rm -rf /backup/www/*
# Find last backup
last_backup_file=`ls -1 $Work_dir | grep "backup_" | sort | tail -n 1`;
unzip $Work_dir'/'$last_backup_file -d /
echo -e '\e[1;32mWWW restore is done!\e[1;m';

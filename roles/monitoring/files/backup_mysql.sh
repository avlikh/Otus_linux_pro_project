#!/bin/bash

DbName=zabbix;
DATE=`date +"%Y-%m-%d_%Hh-%Mm"`;
Work_dir=/backup/zabbix
DIR=$Work_dir/tempo_backup_$DbName"_"$DATE;
FILE=backup_$DbName"_"$DATE".tar.gz"


mkdir $DIR;

echo -e 'Databese name =\e[1;31m '$DbName'\e[1;m';

for TABLE_NAME in `mysql --skip-column-names -e "SHOW TABLES FROM "$DbName`;
do
mysqldump --set-gtid-purged=OFF --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers $DbName $TABLE_NAME > $DIR/$TABLE_NAME.sql;
done
echo -e "$DbName database backup comleted";
echo -e 'Backup arhivation started...';

tar -czf $Work_dir/$FILE -C $DIR .;
echo -e 'Backup arhivation completed';

echo -e '\e[1;32mMySQL backup is done!\e[1;m';
echo -e 'File:\e[1;31m '$FILE'\e[1;m';

rm -r $DIR;

#backup rotation
find $Work_dir -mtime +31 -exec rm {}  \;

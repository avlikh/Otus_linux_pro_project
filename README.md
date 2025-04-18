# OTUS Professional - disaster recovery project

## Схема проекта:

![image](https://github.com/user-attachments/assets/0602e54a-213a-411d-bd90-72ede9353c69)


### 1) Зайдите на OS, с установленным Ansible, с root доступом.
   - Примечание: используйте пользователя **root** либо команды: **su - root** либо **sudo -i**
### 2) Выполните данную команду на удаленной машине:
```
apt update -y && apt install git -y ; git clone https://github.com/avlikh/Otus_linux_pro_project.git;
```
### 3) Далее потребуется ввести 1 раз пароль для запуска первого Ansible playbook, при выполнении которого будут установлены rsa.pub ключи на хостовые машины
### 4) Выпейте чашку кофе или чая - Ansible будет разварачивать ландшавт около 15-20 минут
### 5) Выполните настройку источников данных и дашбордов Grafana: http://10.68.7.16:3000/login
### 6) Зайдите на Nginx и нагенерируйте запросов для Elastic: http://10.68.7.11/
### 7) Добавьте источник данных и визуализацию в Elastic: http://10.68.7.17:5601
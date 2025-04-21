# OTUS Professional - disaster recovery project

## Схема проекта:

![image](https://github.com/user-attachments/assets/0602e54a-213a-411d-bd90-72ede9353c69)


Для развертывания demo-стенда необходимо иметь следующие подготовленные виртуальные машины с debian  12:

<table>
    <tr>
        <td align=center>Name</td>
        <td align=center>IP</td>
        <td align=center>CPU</td>
        <td align=center>RAM (GB)</td>
        <td align=center>Disk size (GB)</td>
    </tr>
    <tr>
        <td align=center>backup</td>
        <td align=center>10.68.7.10</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>10</td>
    </tr>
    <tr>
        <td align=center>nginx</td>
        <td align=center>10.68.7.11</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>5</td>
    </tr>
    <tr>
        <td align=center>apache1</td>
        <td align=center>10.68.7.12</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>5</td>
    </tr>
    <tr>
        <td align=center>apache2</td>
        <td align=center>10.68.7.13</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>5</td>
    </tr>
    <tr>
        <td align=center>mysqlsrs</td>
        <td align=center>10.68.7.14</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>5</td>
    </tr>
    <tr>
        <td align=center>mysqlrep</td>
        <td align=center>10.68.7.15</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>5</td>
    </tr>
    <tr>
        <td align=center>monitor</td>
        <td align=center>10.68.7.16</td>
        <td align=center>2</td>
        <td align=center>4</td>
        <td align=center>10</td>
    </tr>
    <tr>
        <td align=center>elk</td>
        <td align=center>10.68.7.17</td>
        <td align=center>2</td>
        <td align=center>6</td>
        <td align=center>15</td>
    </tr>  
</table>

### 1) Зайдите на OS, с установленным Ansible, с root доступом.
   - Примечание: используйте пользователя **root** либо команды: **su - root** либо **sudo -i**
### 2) Создайте папку для проекта:
```
mkdir /ansible; cd /ansible
```
### 3) Клонируте репозиторий проекта с Github:
```
apt update -y && apt install git -y; git clone https://github.com/avlikh/Otus_linux_pro_project.git .
```
### 4) Сгенерируйте пару rsa-ключей (если их нет):

```
ssh-keygen -t rsa -q -f "/root/.ssh/id_rsa" -N ""
```
### 5) Выполним роль, которая распространит rsa-ключи на все хосты ландшавта. Для этого, запустим provision.yml с тегом "keys"

```
ansible-playbook provision.yml --tags "keys" -u root --ask-pass
```
### 6) Развернем ландшавт выполнив команду:
```
ansible-playbook provision.yml
```


### 3) Далее потребуется ввести 1 раз пароль для запуска первого Ansible playbook, при выполнении которого будут установлены rsa.pub ключи на хостовые машины
### 4) Выпейте чашку кофе или чая - Ansible будет разварачивать ландшавт около 15-20 минут
### 5) Выполните настройку источников данных и дашбордов Grafana: http://10.68.7.16:3000/login
### 6) Зайдите на Nginx и нагенерируйте запросов для Elastic: http://10.68.7.11/
### 7) Добавьте источник данных и визуализацию в Elastic: http://10.68.7.17:5601

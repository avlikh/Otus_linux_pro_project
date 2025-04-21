# OTUS Professional - disaster recovery project

## Схема проекта:

![image](https://github.com/user-attachments/assets/0602e54a-213a-411d-bd90-72ede9353c69)


#### Для развертывания demo-стенда необходимо иметь следующие подготовленные виртуальные машины с debian  12:

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
    <tr>
        <td align=center>ansible*</td>
        <td align=center>10.68.7.18</td>
        <td align=center>1</td>
        <td align=center>1</td>
        <td align=center>5</td>
    </tr> 
</table>
*Роль Ansible-хоста может выполнить любая машина, имеющая доступ к сети стенда.

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
### 4) Что бы изменить ip-адреса, внесите изменения в файлы hosts.ini и group_vars/all.yml :
```
nano hosts.ini
nano group_vars/all.yml
```

### 5) Сгенерируйте пару rsa-ключей (если их нет):

```
ssh-keygen -t rsa -q -f "/root/.ssh/id_rsa" -N ""
```
### 6) Выполним роль, которая распространит rsa-ключи на все хосты ландшавта. Для этого, запустим provision.yml с тегом "keys"

```
ansible-playbook provision.yml --tags "keys" -u root --ask-pass
```
### 7) Развернем ландшавт выполнив команду:
```
ansible-playbook provision.yml
```

### Список доступов:
<table>
    <tr>
        <td colspan="4" align=center>Сайт</td>
    </tr>
    <tr>
        <td align=center>URL</td>
        <td align=center>Описание</td>
        <td align=center>Логин</td>
        <td align=center>Пароль</td>
    </tr>
    <tr>
        <td align=center>https://init6.ru/</td>
        <td align=center>Сайт</td>
        <td align=center></td>
        <td align=center></td>
    </tr>
    <tr>
        <td align=center>https://init6.ru/wp-admin</td>
        <td align=center>Админка сайта</td>
        <td align=center>admin</td>
        <td align=center>Init0000####</td>
    </tr>
    <tr>
        <td colspan="4" align=center>Мониторинг</td>
    </tr>
    <tr>
        <td align=center>URL</td>
        <td align=center>Описание</td>
        <td align=center>Логин</td>
        <td align=center>Пароль</td>
    </tr>
    <tr>
        <td align=center>https://zabbix.init6.ru/zabbix/</td>
        <td align=center>Заббикс</td>
        <td align=center>Admin</td>
        <td align=center>zabbix</td>
    </tr>
    <tr>
        <td align=center>https://grafana.init6.ru/</td>
        <td align=center>Grafana</td>
        <td align=center>admin</td>
        <td align=center>admin</td>
    </tr>
    <tr>
        <td colspan="4" align=center>Логгирование</td>
    </tr>
    <tr>
        <td align=center>URL</td>
        <td align=center>Описание</td>
        <td align=center>Логин</td>
        <td align=center>Пароль</td>
    </tr>
    <tr>
        <td align=center>https://elk.init6.ru/</td>
        <td align=center>Elk</td>
        <td align=center></td>
        <td align=center></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="3" align=center>Иммитируем события журнала</td>
    </tr>
    <tr>
        <td align=center>Уровень события</td>
        <td align=center>Уровень события</td>
        <td align=center>Команда</td>
    </tr>
    <tr>
        <td align=center>0</td>
        <td align=center>emerg</td>
        <td align=center>logger -p user.emerg "Emergency level log"</td>
    </tr>
    <tr>
        <td align=center>1</td>
        <td align=center>alert</td>
        <td align=center>logger -p user.alert "Alert level log"</td>
    </tr>
    <tr>
        <td align=center>2</td>
        <td align=center>crit</td>
        <td align=center>logger -p user.crit "Critical level log"</td>
    </tr>
    <tr>
        <td align=center>3</td>
        <td align=center>err</td>
        <td align=center>logger -p user.err "Error level log"</td>
    </tr>
</table>

### 3) Далее потребуется ввести 1 раз пароль для запуска первого Ansible playbook, при выполнении которого будут установлены rsa.pub ключи на хостовые машины
### 4) Выпейте чашку кофе или чая - Ansible будет разварачивать ландшавт около 15-20 минут
### 5) Выполните настройку источников данных и дашбордов Grafana: http://10.68.7.16:3000/login
### 6) Зайдите на Nginx и нагенерируйте запросов для Elastic: http://10.68.7.11/
### 7) Добавьте источник данных и визуализацию в Elastic: http://10.68.7.17:5601

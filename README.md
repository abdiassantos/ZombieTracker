# TRZ (The Resident Zombie) - Backend

## Tecnologies and versions:
* Ruby - 2.7.1
  ```bash
    sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    rvm install 2.7.1
    rvm use 2.7.1 --default
    ruby -v
  ```
  
* Rails 6.0.2.2
  ```bash
    gem install rails -v 6.0.2.2
    rbenv rehash
    rails -v
  ```
* RVM lastest version
    > Link to Linux download and installation -  <https://gorails.com/setup/ubuntu/20.04>

    > Link to MacOS download and installation -  <https://gorails.com/setup/osx/10.15-catalina>

    > Link to Windows download and installation - <https://gorails.com/setup/windows/10>
* PostgreSQL
    > link to Windows, Linux and MacOS, download e instalação of PostgreSQL - <https://www.enterprisedb.com/downloads/postgres-postgresql-downloads>

* Conigure the file "database.yml" with your username, password of your postgresql configuration.

## Installing dependencies and gems:
* Installing all dependencies with these commands
```bash
# Command used to generate all bundle files, installing all GemFile Gems, and all node_modules files
bundle install
yarn install --check-files
```

## Creating and migrating all the database structure
* Execute these command to create our database
    ```bash
      rake db:create
    ```
* Execute these commando to migrate all structure about our tables and schema to our database
    ```bash
      rake db:migrate
    ```

## Running the project
* run these command to start the project
  ```bash
  rails s
  ```
* You can also access the root of our project using these URL and put one route describe below
  > <localhost:3000>

## Thats right, everything is working, and prepared to use these routes below
# ----------------------------------------------------------------------------------
# Routes Uses

## Routes List
* Survivors
* Inventories
* Complaints
* Trades
* Reports

## Survivors Routes

> GET - ListAll
```bash
/api/survivors
```
> GET - ListById
```bash
/api/survivors/:id
```
> POST - Create New
```bash
/api/survivors
```
- Body

![alt text](https://images2.imgbox.com/46/f6/vXsxvEpt_o.png)

> DELETE - DeleteById
```bash
/api/survivors/:id
```
> PUT - UpdateById
```bash
/api/survivors/:id
```
- Body(OBS: Only permit these three params, one or all of them)

![alt text](https://images2.imgbox.com/c0/59/KOi1Zp0H_o.png)

## Inventories Routes

> GET - ListAll
```bash
/api/inventories
```
> GET - ListById
```bash
/api/inventories/:id
```
> POST - Create New
```bash
/api/inventories
```
- Body

![alt text](https://images2.imgbox.com/c5/50/EDRoIfXG_o.png)

## Complaints Routes

> GET - ListAll
```bash
/api/complaints
```
> GET - ListById
```bash
/api/complaints/:id
```
> POST - Create New
```bash
/api/complaints
```
- Body

![alt text](https://images2.imgbox.com/c6/c6/huZIPXsI_o.png)

## Trades Routes

> POST - Create New
```bash
/api/complaints
```
- Body

![alt text](https://images2.imgbox.com/38/92/IyVnnHXD_o.png)

## Reports Routes

> GET - ListAll
```bash
/api/reports
```
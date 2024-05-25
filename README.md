# 1shotSequel
A simple, language-agnostic declarative approach to setting up a new MySQL local user and database with one command using Makefile automation.

- Find the PostgreSQL version here: [addIOlogic/1shot](https://github.com/addIOlogic/1shot) 

## Prerequisites

### Clone the repository:
-          git clone https://github.com/osag1e/1shotSequel.git


### Modify the .env.local file to add your own credentials:
```
DB_HOST=localhost
DB_PORT=3306
DB_USER=
DB_PASSWORD=
DB_NAME=
```
### create a `.my.cnf` file in your home directory with:
-                   nvim ~/.my.cnf

Include your MySQL root or custom credentials:
```
[client]
user=root
password=yourpassword
host=localhost
```
Save file and quit neovim with:
-                 :wq 

-  Just use nano if you get stuck 🙃

### Set the permissions to ensure only you can read the file with:
-                  chmod 600 ~/.my.cnf


### To run the script, use:
-          make setup_database

![1shotSequel](https://github.com/osag1e/1shotSequel/blob/main/1shotSequel.png)

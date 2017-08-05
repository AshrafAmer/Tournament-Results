# Tournament Website

Players are eliminated when they lose a match, each paire of players in each round with opponents having approximathy the nearest win record.

## Installation
To run this code you must need  Virtual Machine installed on your operating system.
We're using tools called Vagrant and VirtualBox to install and manage the VM. 
You'll need to install these.

### Install VirtualBox 
you can Install the platform package for your operating system easly from [here](https://www.virtualbox.org/wiki/Downloads)

 ### Install Vagrant 
you can Install it for your operating system easly from [here](https://www.vagrantup.com/downloads.html)

## Usage
* open your command line.
* Then go to the directory where the program are.
* Write the following command:
`$ psql -f tournament.sql
 $ python tournament.py`

## More Information

### What does this DataBase consist of?

#### This DatBase have two tables:

First Table: **_Players_**
```
Identify players id and names 
```

Second Table: **_matches_**
```
Identify number of matches and player's score.
```

#### This project consists of three files

1- **_tournament_** : this python file connected to DataBase.

2- **_tournament_test_** : this python file designed a game and test DataBase. 

3- **_tournament.sql_** : this file contained DataBase Tables.

## Author

Ashraf Amer

## License

Copyright(c) 2017 Ashraf Amer
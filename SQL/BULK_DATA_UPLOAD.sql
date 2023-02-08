-- create database FSDA_INEURON;
USE FSDA_INEURON;
CREATE TABLE AM_BROKERS
  (
    BrokerID CHAR(8) PRIMARY KEY,
    BrokerCode VARCHAR(15),
    BrokerFullName CHAR(40),
    DistributionNetwork CHAR(15),
    DistributionChannel CHAR(20),
    CommissionScheme CHAR(20)
);
-- OPT_LOCAL_INFILE=1
/*
LOAD DATA LOCAL INFILE 'D:/Vijay Kasotia Drive/Practice Dive/AtliQ Hardware Analysis/Brokers.csv'
INTO TABLE BROKERS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SHOW GLOBAL VARIABLES LIKE 'local_infile'; -- OFF
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile'; -- ON
*/


LOAD DATA LOCAL INFILE 'C:/Users/amina/Downloads/br.csv'
INTO TABLE AM_BROKERS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


SHOW GLOBAL VARIABLES LIKE 'local_infile'; -- OFF
SET GLOBAL local_infile = 1;
SHOW GLOBAL VARIABLES LIKE 'local_infile'; -- ON  

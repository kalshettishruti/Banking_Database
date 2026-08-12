show databases;

-- create new table
create database BankDB;
use BankDB;

-- create table
create table Customer(
	Customer_id int primary key,
    First_Name varchar(50),
    Last_Name varchar(50),
    Email varchar(100),
    Phone_No bigint,
    Account_Creation_Date date
    );
    
    
    
    
    
    

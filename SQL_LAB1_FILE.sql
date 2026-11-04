/* LAB 1 */

show databases;

-- create new table
create database BankDB;
use BankDB;

/* LAB 2 */

-- create table
create table Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

    CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

create table branches(
	branch_id int,
    branch_name varchar(30),
    branch_address varchar(100),
    branch_phone bigint
);
    
create table account_branches(
	assignment_date date
);

create table loans (
    loan_id INT,
    loan_amount DECIMAL(10,2),
    interest_rate DECIMAL(5,2),
    start_date DATE,
    end_date DATE
);

-- UPDATE COMMAND
    
-- updates the phone number of CustomerID 101.
update Customers set Phone = 9999999999 where CustomerID = 101;

-- Update Customer Email Address
update Customers set Email = "rahul_sharma@gmail.com" where CustomerID = 101;


-- DELETE COMMAND

-- Delete Transaction Record of 302
delete from Transactions where TransactionID = 302;

-- Delete Account Record
delete from Accounts where AccountID = 202;

-- ALTER COMMAND

-- Adding DateOfBirth column to the Customers table.
alter table Customers add column date_of_birth date;

-- Increasing the size of the Phone column.
alter table Customers modify Phone varchar(20);

-- Adding a minimum balance rule to the Accounts table.
alter table Accounts add constraint chk_min_balance check(Balance >= 1000);
    
-- DROP COMMAND

-- deletes the AccountBranches table from the database
drop table account_branches;

-- CONSTRAINTS

-- Add Primary key Constraint to CustomerID in Customers Table
alter table customers add primary key(CustomerID);

-- Now Connect Accounts Table using CustomerID from Customers table.
alter table accounts add column CustomerID int;

alter table accounts add constraint fk_customer_id foreign key(CustomerID) references customers(CustomerID);

-- Ensure that every customer must have a first name
alter table customers modify FirstName varchar(50) not null;

-- Ensure that each customer email is unique.
alter table Customers add constraint uq_email unique(email);

/* ACTIVITY */

-- connect accounts with branches
alter table branches add primary key(branch_id);

alter table accounts add column branch_id int;

alter table accounts add constraint fk_account_branch foreign key (branch_id) references branches(branch_id);

-- connect transaction with accounts
alter table accounts add primary key(AccountID);

alter table Transactions add column AccountID int;

alter table Transactions add constraint fk_account_transaction
 foreign key (AccountID) references accounts(AccountID);

-- connect loans with customer
alter table loans add column CustomerID int;

alter table loans add constraint fk_loan_customer foreign key(CustomerID) references Customers(CustomerID);


/* LAB 3 */

INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, date_of_birth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','1998-04-15');

-- Insert 4 Records into Customers Table
INSERT INTO Customers
(CustomerID, FirstName, LastName, Email, Phone, date_of_birth)
VALUES
(102, 'Priya', 'Patil', 'priya@gmail.com', '9988776655', '2000-09-20'),
(103, 'Amit', 'Patel', 'amit.patel@gmail.com', '9876500001', '1995-06-18'),
(104, 'Sneha', 'Joshi', 'sneha.joshi@gmail.com', '9876500002', '1997-09-12'),
(105, 'Rohan', 'Kulkarni', 'rohan.k@gmail.com', '9876500003', '1993-11-25');

INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(201,101,'Savings',25000);
-- Insert 4 Records into Accounts Table
INSERT INTO Accounts
(AccountID, CustomerID, AccountType, Balance)
VALUES
(202, 102, 'Current', 40000),
(203, 103, 'Savings', 35000),
(204, 104, 'Current', 60000),
(205, 105, 'Savings', 45000);

-- Insert 5 Records into Transactions Table
INSERT INTO Transactions
(TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES
(301, 201, '2025-05-10', 5000, 'Deposit'),
(302, 202, '2025-05-11', 2500, 'Withdraw'),
(303, 203, '2025-05-12', 10000, 'Deposit'),
(304, 204, '2025-05-13', 3000, 'Withdraw'),
(305, 205, '2025-05-14', 7000, 'Deposit');

-- Insert 5 Records into branches Table
INSERT INTO Branches
(branch_id, branch_name, branch_address, branch_phone)
VALUES
(1, 'Mumbai Branch', 'Andheri, Mumbai', '0221111111'),
(2, 'Pune Branch', 'Shivaji Nagar, Pune', '0202222222'),
(3, 'Nashik Branch', 'College Road, Nashik', '0253222222'),
(4, 'Nagpur Branch', 'Sitabuldi, Nagpur', '0712333333'),
(5, 'Navi Mumbai Branch', 'Vashi, Navi Mumbai', '0224444444');

-- Insert 5 Records into Loans Table
INSERT INTO loans VALUES
(301, 500000, 8.50, '2025-01-15', '2030-01-15', 101),
(302, 300000, 9.25, '2025-02-10', '2028-02-10', 102),
(303, 750000, 8.75, '2025-03-20', '2032-03-20', 103),
(304, 250000, 10.00, '2025-04-05', '2029-04-05', 104),
(305, 1000000, 7.95, '2025-05-12', '2035-05-12', 105);


-- UPDATE COMMAND
    
-- updates the phone number of CustomerID 101.
update Customers set Phone = 9999999999 where CustomerID = 101;
    
    select * from Customers;
    
-- Update Customer Email Address
update Customers set Email = "rahul_sharma@gmail.com" where CustomerID = 101;

-- update balance of accountid 201 to 30000
update accounts set balance = 30000 where AccountID=201;

	select * from accounts;


-- DELETE COMMAND

-- Delete Transaction Record of 302
delete from Transactions where TransactionID = 302;

	select * from Transactions;

-- Delete Account Record
delete from Accounts where AccountID = 202;


/* LAB 4 */

-- display customer names, email addresses, and phone numbers from customers
select firstname ,lastname ,email,phone from customers;

-- Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.
select accountid,accounttype,balance from accounts;

-- Retrieve Customers with Savings Accounts
select * from accounts where AccountType = "Savings";

-- Retrieve Accounts with Balance Greater Than 25000
select * from accounts where balance > 25000;

-- Retrieve Transactions Between Specific Amounts 5000 AND 20000
select * from transactions where amount between 5000 AND 20000;

--  Retrieve customer records for CustomerID 101,102,103
select * from customers where customerid in (101,102,103);

-- displays customers whose names start with the letter R.
select * from customers where firstname like "R%";

/* ACTIVITY*/
-- Retrieve all current account records
select * from accounts;

-- Find accounts with balance less than 15000
select * from accounts where balance < 15000;

-- Display transactions between 1000 and 10000
select * from transactions where amount between 1000 and 10000;

-- Retrieve customer records for CustomerID 104 and 105
select * from customers where CustomerID in (104,105);

-- Display customers whose last name starts with S
select * from customers where lastname like "S%";


-- Display Customers in Alphabetical Order
select * from customers order by firstname asc;

-- Display Accounts with Highest Balance First
select * from accounts order by balance asc;

-- removes duplicate account types from the result.
select distinct accounttype from accounts;

-- Display Top 3 Highest Balance Accounts
select * from accounts order by balance desc limit 3;

-- skips the first 2 records and displays the next 5 records from transactions
select * from transactions limit 5 offset 2;


/*ACTIVITY*/

-- Display customers sorted by LastName
select * from customers order by lastname asc;

-- Retrieve top 5 transactions with highest amount
select * from transactions order by amount desc limit 5;

-- Display unique transaction types
select distinct transactiontype from transactions;

-- Skip the first 3 transaction records and display the next 4 records
select * from transactions limit 4 offset 3;


--  displays customer records where phone number is missing.
select * from customers where phone is null;

-- displays customers having email information available.
select * from customers where email is not null;


/*ACTIVITY*/

-- Find customers without email addresses
select * from customers where email is null;

-- Display all accounts where balance information is available
select * from accounts where balance is not null;


-- CATEGORIZE

-- categorizes customer accounts based on balance amount.
select accountid , balance ,
	case  
		when balance >= 50000 then 'Premium Account'
		when Balance >= 25000 then 'Standard Account'
		else 'Basic Account'
       end as AccountCategory
from accounts;

/* activity

Create a report that categorizes transactions as:

High Transaction
Medium Transaction
Low Transaction
based on transaction amount.
*/

select * from transactions;

select transactionid , amount ,
	case
		when amount <=3000 then "low transaction"
        when amount <=5000 then "medium transaction"
        else "high transaction"
        end as transaction_status
from transactions;


-- WINDOW FUNCTION

-- assigns rank to accounts according to balance.
select accountid , balance ,
	RANK() over (order by balance desc) Balance_Rank
from accounts;

-- generates a running total of transaction amounts.
select transactionid , transactiondate , amount ,
	sum(amount) over(order by transactiondate) as Running_amount
from transactions;

--  displays the overall average transaction amount alongside each transaction.
select transactionid , amount ,
	avg(amount) over() as Avg_transaction
from transactions;

/* ACTIVITY */

-- Rank customers based on account balance
select customerid , balance ,
	rank() over(order by balance desc) as Balance_rank
from accounts;

-- Generate running total for account balances
select accountid , balance ,
	sum(balance) over(order by accountid) as Running_balance
from accounts;

-- Display maximum transaction amount using a window function
select * ,
	max(amount) over() as max_transaction_amount
from transactions;

/* LAB 5 */

-- Search Customers Whose First Name Starts with “A”
select * from customers where firstname like "A%";

-- earch Customers Whose Email Contains “gmail”
select * from customers where Email like "%gmail%";

-- Search Customers Whose Last Name Ends with “kar”
select * from customers where lastname like "%kar";

-- Display customers whose first name starts with R
select * from customers where firstname like "R%";

-- Find customers whose email contains yahoo
select * from customers where Email like "%yahoo%";

-- Display customers whose last name starts with P
select * from customers where lastname like "p%";

-- Search customers whose phone number ends with 99
select * from customers where phone like "%99";


-- The finance team wants to review only Savings and Current account holders.
select * from accounts where accounttype in ("Savings","Current");

-- The audit department wants to investigate only Deposit and Withdrawal transactions
select * from transactions where transactiontype in ("deposit","withdraw");

-- The customer relationship team wants to review records for a specific set of customers.
select * from customers where customerid in (101,102,103);

/* ACTIVITY*/

-- Display accounts belonging to Salary and Savings account types
select * from accounts where accounttype in ("Savings","salary");

-- Retrieve transactions for Payment and Deposit categories
select * from transactions where transactiontype in ("payment","deposit");

-- Display customer records for CustomerID 103 and 104
select * from customers where customerid in (103,104);

-- Retrieve selected account records using AccountID values
select * from accounts where accountid in (201,205);


-- Display Customers in Ascending Order of Last Name
select * from customers order by lastname asc;

-- Display Accounts with Highest Balance First
select * from accounts order by balance desc;

-- Display Transactions Sorted by Transaction Date 
select * from transactions order by transactiondate desc;


/* ACTIVITY */

-- Display customers sorted by FirstName
select * from customers order by firstname asc;

-- Display accounts sorted by AccountType
select * from accounts order by accounttype asc;

-- Display transactions sorted by Amount in descending order
select * from transations order by amount desc;

-- Display customers sorted by DateOfBirth
select * from customers order by date_of_birth asc;


-- Display Only Top 5 Highest Balance Accounts
select * from accounts order by balance desc limit 5;

-- Skip Initial Transaction Records While Viewing Data
select * from transactions limit 5 offset 3;

-- Display First 3 Customer Records
select * from Customers limit 3;



-- Display Savings Account Customers Sorted by Balance
select * from Accounts where AccountType = 'Savings'
order by Balance desc;

-- Search Customers Using Partial Name and Limit Results
select * from Customers where FirstName LIKE 'S%' limit 5;

-- Display Selected Transactions in Sorted Order
select * from Transactions
where TransactionType in ('Deposit','Withdrawal')
order by TransactionDate desc;

/* ACTIVITY */

-- Display top 3 transactions with highest amount
select * from transactions order by amount desc limit 3;

-- Retrieve only 4 customer records
select * from customers limit 4;

-- Skip first 2 account records and display next 3 records
select * from accounts limit 3 offset 2;

-- Display top 5 latest transactions
select * from transactions order by transactiondate desc limit 5;


-- Display Savings Account Customers Sorted by Balance
select * from accounts where accounttype = "Savings" order by balance desc;

-- Search Customers Using Partial Name and Limit Results
select * from customers where firstname like "S%" limit 5;

-- Display Selected Transactions in Sorted Order
select * from transactions where transactiontype in ("deposit","withdraw") order by transactiondate desc;

/* Lab 6 */

-- STRING FUNCTIONS

-- Display customer Table
select * from customers;

-- Display all customer FirstName in uppercase
select firstname , upper(firstname) as "upper_case_name" from customers;

-- Display all customer FirstName in lowercase.
select firstname , lower(firstname) as "lower_case_name" from customers;

-- Find the total number of characters in each customer FirstName 
select firstname , length(firstname) as "name_len" from customers;

-- Display only the first three characters of customer FirstName 
select firstname , left(firstname,3) as "initials" from customers;

-- Combine customer's FirstName with LastName.
select firstname , lastname , concat(firstname," - ",lastname) as "full_name" from customers;


-- MATH Functions 

select round(3.4) as rounded_value;
select ceil(1256.25) as Ceiling_Value;
select floor(1256.75) as Floor_Value;
select abs(-2500) as Absolute_Value;
select mod(25,4) as Remainder;

-- DATE FUCTIONS

-- Display customer Table
select * from customers;

-- Display the current system date
select curdate();

-- Display the current system date and time.
select now();

-- Display the Birth of year
select customerid , year(date_of_birth) as "birth_of_year" from customers;

-- Display the Birth month.
select customerid , month(date_of_birth) as "month_of_year" from customers;

-- Calculate the number of days since BirthDate
select customerid , datediff(curdate(),date_of_birth) as days from customers;

-- COMPARISON FUCTIONS

-- Categorize customers as Adult or Young based on their birth year
select firstname , date_of_birth ,
	if(year(date_of_birth)<= 1995,"Adult","Young") as category 
    from customers;
    
-- Display 'Not Available' if a phone number is NULL.
select firstname , ifnull(phone,"not available") as phone_number from customers;

-- Find the latest birth date.
SELECT GREATEST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS LatestBirthDate;

-- Find the earliest birth date.
SELECT LEAST(
'2000-09-20',
'1995-06-18',
'1997-09-12',
'1993-11-25'
) AS EarliestBirthDate;

-- Compare two customer names
SELECT 
    FirstName, NULLIF(FirstName, 'Priya') AS Result
FROM
    Customers;

-- AGGREGATE FUNCTIONS

-- Calculate the total balance maintained across all customer accounts.
select sum(balance) as "Total_balance" from accounts;

-- Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
select avg(balance) as "Avg_balance" from accounts;

-- Identify the highest balance maintained in any customer account.
select max(balance) as "highest_balance" from accounts;

-- Identify the lowest balance maintained in any customer account.
select min(balance) as "lowest_balance" from accounts;

-- Determine the total number of customer accounts available in the system.
select count(*) as "No_of_accounts" from accounts;


-- group by function

-- The bank wants to calculate the total account balance for 
-- each AccountType by grouping the records based on AccountType and identify
--  which account type is attracting the highest total deposits from customers.
select accounttype,sum(balance) as "total_balance" from accounts group by accounttype;

-- The bank management wants to identify only those account types whose total customer
-- deposits exceed ₹25,000.
select accounttype,sum(balance) as "total_balance" from accounts 
group by accounttype having sum(balance)>25000 ;


/*Lab 7*/

-- WINDOW FUNCTIONS

-- Rank Customer Loans Using RANK()
Select
    loan_id,
    CustomerID, loan_amount, RANK() OVER(
        ORDER BY loan_amount DESC
    ) AS LoanRank
FROM Loans;

-- Rank Customer Loans Using DENSE_RANK()
SELECT
    loan_id,
    CustomerID,
    loan_amount,
    DENSE_RANK() OVER(
        ORDER BY loan_amount DESC
    ) AS DenseRank
FROM Loans;

--  Assign Row Numbers Using ROW_NUMBER()
SELECT
    loan_id,
    CustomerID,
    loan_amount,
    ROW_NUMBER() OVER(
        ORDER BY loan_amount DESC
    ) AS RowNumber
FROM Loans;

--  PARTITION BY
SELECT
    loan_id,
    CustomerID,
    loan_amount,
    ROW_NUMBER() OVER(
        PARTITION BY CustomerID
        ORDER BY loan_amount DESC
    ) AS RowNum
FROM Loans;

-- Calculate Running Total Using SUM() OVER()
SELECT
    loan_id, CustomerID,loan_amount,
    SUM(loan_amount) OVER(
        ORDER BY loan_amount DESC
    ) AS RunningTotal
FROM Loans;

-- Compare Previous Loan Records Using LAG()
SELECT
    loan_id,
    CustomerID,
    loan_amount,
    LAG(loan_amount) OVER(
        ORDER BY loan_amount DESC
    ) AS PreviousLoanAmount
FROM Loans;

-- Compare Next Loan Records Using LEAD()
SELECT
    loan_id, CustomerID, loan_amount,
    LEAD(loan_amount) OVER(
        ORDER BY loan_amount DESC
    ) AS NextLoanAmount
FROM Loans;


/* Lab 8 */

-- Task 1: Generate Accounts Transaction Reports
SELECT a.AccountID, a.AccountType, a.Balance,
t.TransactionID,
t.TransactionDate,
t.TransactionType,
t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID;

-- Task 2: Display All Accounts Including Those Without Transactions
SELECT a.AccountID, a.AccountType, a.Balance,
t.TransactionID,
t.TransactionDate,
t.TransactionType,
t.Amount
FROM Accounts a
LEFT JOIN Transactions t
ON a.AccountID = t.AccountID;

-- Task 3: Generate Deposit Transaction Reports
SELECT a.AccountID, a.AccountType, a.Balance,
t.TransactionID,
t.TransactionDate,
t.TransactionType,
t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE t.TransactionType = 'Deposit';

-- Task 4: Generate High Balance Account Transaction Reports
SELECT a.AccountID, a.AccountType, a.Balance,
t.TransactionID,  
t.TransactionDate,
t.TransactionType,
t.Amount
FROM Accounts a
INNER JOIN Transactions t
ON a.AccountID = t.AccountID
WHERE a.Balance > 30000
ORDER BY a.Balance DESC;

/* LAB 9 */

-- subquery

-- transactions whose amount is greater than the average transaction amount.
select * from transactions
where amount > (
	select avg(amount) from transactions
);

-- Identify Accounts with Above-Average Balance
select accountid , accounttype , balance , customerid
from accounts
where balance > (
	select avg(balance)
    from accounts
)
order by balance desc;

--  identify all bank accounts that have performed Deposit transactions.
select accountid,accounttype,balance,customerid
from accounts
where accountid in (
	select accountid 
    from transactions
    where transactiontype = 'deposit'
);

-- Identify the Account with the Highest Balance
select accountid,accounttype,balance,customerid
from accounts
where balance = (
	select max(balance) from accounts
);

/* LAB 10 */

-- view

-- Create a View for High-Balance Accounts
create view high_account_balance as 
select * from accounts 
where balance > 30000;

select * from high_account_balance;

-- Modify the View to Include Transaction Details
create or replace view high_account_balance as 
select 
a.accountid,a.accounttype,a.balance,a.customerid,
t.transactionid,t.transactiondate,t.amount,t.transactiontype
from accounts a
inner join transactions t
on a.accountid = t.accountid where a.balance > 30000;

select * from high_account_balance;

-- displays a sorted report of high-balance accounts along with their transaction details.
select * from high_account_balance order by balance desc;

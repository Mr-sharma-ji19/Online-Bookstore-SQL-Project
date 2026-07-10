-- create database
-- CREATE DATABASE  Online_bookstore;
-- use defaultpage
USE Online_bookstore;

-- create tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
Book_ID SERIAL PRIMARY KEY,
Title VARCHAR(100),
Author VARCHAR(100),
Genre VARCHAR(50),
Published_Year int,
PRICE NUMERIC(10,2),
Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE customers(
Customer_ID SERIAL PRIMARY KEY,
Name VARCHAR(100),
Email VARCHAR(100),
Phone VARCHAR(15),
City VARCHAR(50),
Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders(
Order_ID SERIAL PRIMARY KEY,
Customer_ID INT REFERENCES Customers(Customer_ID),
Book_ID INT REFERENCES Books(Book_ID),
Quantity INT,
Total_Amount NUMERIC(10,2)
);
SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

LOAD DATA LOCAL INFILE 'D:/SQL PROJECTS/project files/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Book_ID, Title, Author, Genre, Published_Year, Price, Stock);

LOAD DATA LOCAL INFILE 'D:/SQL PROJECTS/project files/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Customer_ID, Name, Email, Phone, City, Country);

LOAD DATA LOCAL INFILE 'D:/SQL PROJECTS/project files/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Order_ID, Customer_ID, Order_Date, Quantity, Total_Amount);


SHOW TABLE;
DESCRIBE Customers;
SELECT COUNT(*) FROM Customers;
SELECT * FROM Customers LIMIT 10;
DESCRIBE Orders;
DROP TABLE Orders;
CREATE TABLE Orders (
    Order_ID BIGINT UNSIGNED PRIMARY KEY,
    Customer_ID BIGINT UNSIGNED,
    Book_ID BIGINT UNSIGNED,
    Order_Date DATE,
    Quantity INT,
    Total_Amount DECIMAL(10,2),

    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);
SELECT COUNT(*) FROM Books;
SELECT COUNT(*) FROM Customers;
SELECT COUNT(*) FROM Orders;
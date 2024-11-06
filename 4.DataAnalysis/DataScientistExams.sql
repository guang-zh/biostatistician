-- Create the sales database
CREATE DATABASE sales_db;

-- Use the sales database
USE sales_db;

-- Create the sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    amount DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO users (id, name, email) VALUES (1, 'John Doe', 'john@example.com');

-- Connect to a database using odbc package
library(odbc)

con <- dbConnect(odbc::odbc(), "sales_db")




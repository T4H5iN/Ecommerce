-- ==================================================
-- E-COMMERCE DATABASE SCHEMA
-- Created: January 31, 2026
-- ==================================================

-- DROP DATABASES IF EXIST (uncomment if you want to reset)
-- DROP DATABASE IF EXISTS credentials;
-- DROP DATABASE IF EXISTS shop;

-- ==================================================
-- DATABASE 1: credentials
-- Used for: User authentication, login, and comments
-- ==================================================
CREATE DATABASE IF NOT EXISTS credentials;
USE credentials;

-- Admin Login Table
CREATE TABLE IF NOT EXISTS adminlogin (
    username VARCHAR(50) PRIMARY KEY,
    password VARCHAR(255) NOT NULL
);

-- Customer Login Table
CREATE TABLE IF NOT EXISTS customerlogin (
    username VARCHAR(50) PRIMARY KEY,
    Password VARCHAR(255) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    dateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    securityQuestion VARCHAR(255) NOT NULL
);

-- Comments Table
CREATE TABLE IF NOT EXISTS comments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL,
    itemName VARCHAR(100) NOT NULL,
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Username) REFERENCES customerlogin(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Purchase History Table (stored in credentials database)
CREATE TABLE IF NOT EXISTS purchasehistory (
    purchaseID INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    dateOfPurchase DATETIME NOT NULL,
    FOREIGN KEY (username) REFERENCES customerlogin(username) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ==================================================
-- DATABASE 2: shop
-- Used for: E-commerce operations, products
-- ==================================================
CREATE DATABASE IF NOT EXISTS shop;
USE shop;

-- Shop Items Table
CREATE TABLE IF NOT EXISTS shopitems (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Category VARCHAR(50) NOT NULL,
    Name VARCHAR(100) NOT NULL UNIQUE,
    Price DECIMAL(10, 2) NOT NULL,
    Quantity INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- ==================================================
-- SAMPLE DATA (OPTIONAL)
-- ==================================================

USE credentials;

-- Insert default admin account (change password in production!)
INSERT INTO adminlogin (username, password) VALUES 
('admin', 'admin123');

-- Insert sample customer (for testing)
INSERT INTO customerlogin (username, Password, fullName, dateOfBirth, Gender, securityQuestion) VALUES 
('testuser', 'test123', 'Test User', '1990-01-01', 'Male', 'What is your favorite color? Blue');

USE shop;

-- Insert sample shop items
INSERT INTO shopitems (Category, Name, Price, Quantity) VALUES 
('Electronics', 'Laptop', 45000.00, 10),
('Electronics', 'Smartphone', 25000.00, 15),
('Electronics', 'Headphones', 2500.00, 30),
('Clothing', 'T-Shirt', 500.00, 50),
('Clothing', 'Jeans', 1500.00, 40),
('Books', 'Java Programming', 800.00, 20),
('Books', 'MySQL Database', 750.00, 15);

-- ==================================================
-- VERIFY INSTALLATION
-- ==================================================
SELECT 'Database setup completed successfully!' AS Status;

USE credentials;
SELECT 'credentials database tables:' AS Info;
SHOW TABLES;

USE shop;
SELECT 'shop database tables:' AS Info;
SHOW TABLES;

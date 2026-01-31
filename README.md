# E-Commerce Application

A desktop-based e-commerce management system built with Java Swing, featuring separate interfaces for administrators and customers.

## Overview

This application provides a complete e-commerce solution with inventory management, user authentication, shopping cart functionality, and purchase history tracking. The system supports two user roles: administrators who manage products and view analytics, and customers who can browse, purchase, and review products.

## Features

### Customer Features
- User registration and authentication
- Product browsing by category
- Search functionality
- Shopping cart management
- Purchase history tracking
- Product review and comments
- Profile management
- Password recovery

### Administrator Features
- Product inventory management (add, update, delete)
- Customer account overview
- Purchase history monitoring
- Product review moderation
- Category-based product organization

## Technology Stack

- **Language:** Java
- **GUI Framework:** Java Swing with FlatLaf Look and Feel
- **Database:** MySQL 8.x
- **JDBC Driver:** MySQL Connector/J 8.1.0
- **PDF Generation:** iText
- **Build Tool:** Apache Ant (NetBeans)

## Prerequisites

- Java Development Kit (JDK) 11 or higher
- MySQL Server 8.0 or higher
- MySQL Connector/J 8.1.0
- NetBeans IDE (recommended) or any Java IDE

## Database Setup

1. Start your MySQL server

2. Run the database schema script:
```bash
mysql -u root -p < database_schema.sql
```

3. The script will create two databases:
   - `credentials` - User authentication and purchase records
   - `shop` - Product inventory and catalog

4. Default credentials:
   - Admin: username `admin`, password `admin123`
   - Test Customer: username `testuser`, password `test123`

## Installation

1. Clone or download this repository

2. Configure database connection:
   - Update credentials in `DatabaseConnection.java` if needed
   - Default: `localhost:3306`, user: `root`, password: `your_password`

3. Add MySQL Connector JAR to project libraries:
   - Path: `F:\Important Softwares\mysql-connector-j-8.1.0\mysql-connector-j-8.1.0.jar`
   - Or update the path in `nbproject/project.properties`

4. Open the project in NetBeans

5. Build and run the project

## Usage

### Customer Workflow
1. Register a new account or login with existing credentials
2. Browse products by category or search by name
3. Add items to cart with desired quantity
4. Complete purchase and generate receipt
5. View purchase history and manage profile

### Administrator Workflow
1. Login with admin credentials
2. Manage product inventory
3. Monitor customer purchases
4. View and moderate product reviews

## Database Schema

### credentials Database
- `adminlogin` - Administrator credentials
- `customerlogin` - Customer profiles and authentication
- `comments` - Product reviews
- `purchasehistory` - Transaction records

### shop Database
- `shopitems` - Product catalog with pricing and inventory

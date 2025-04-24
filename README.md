# SQL Data Analysis – Summary (MySQL Workbench)

## Overview
This project involves analyzing a basic eCommerce dataset using SQL in MySQL Workbench. Two tables—`customers` and `orders`—were created to simulate a sales database.

## Key SQL Processes

**A. SELECT, WHERE, ORDER BY, GROUP BY**  
Basic filtering and aggregation were performed to retrieve meaningful insights, such as high-value orders, order counts by country, and sorted customer spending.

**B. JOINS (INNER, LEFT, RIGHT)**  
Different types of joins were used to combine customer and order data, including retrieving customers with and without orders.

**C. Subqueries**  
Nested queries helped identify advanced patterns, such as customers whose average spending exceeded the overall average.

**D. Aggregate Functions (SUM, AVG)**  
Used to calculate total and average values, enabling insights like total customer spend and average order value per country.

**E. Views for Analysis**  
Created reusable views such as `customer_spending` to simplify future queries and reporting.

**F. Optimizing with Indexes**  
Indexes were added to frequently queried columns (e.g., `customer_id`, `country`) to improve query performance. Indexes were verified using `SHOW INDEX`.

## Deliverables
- SQL script file with queries and table creation
- Screenshots of query outputs
- This summary README for documentation

## Tools
- MySQL Workbench for writing and executing SQL queries

## Learning Outcome
Gained practical experience in writing analytical SQL queries, optimizing performance, and structuring data for business insights.

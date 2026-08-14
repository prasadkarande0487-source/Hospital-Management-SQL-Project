# Hospital Management System – SQL Project

##  Project Overview

The **Hospital Management System** is a relational database project developed using **MySQL**. The purpose of this project is to manage and organize hospital-related information such as patients, doctors, departments, appointments, medical records, prescriptions, medicines, laboratory tests, admissions, rooms, staff, and billing.

The project focuses on designing a structured relational database and using SQL queries to retrieve, analyze, and manage hospital data.

---

##  Project Objectives

The main objectives of this project are:

* To design a relational database for a hospital management system.
* To create tables with appropriate primary keys and foreign keys.
* To establish relationships between different hospital entities.
* To insert and manage hospital-related records.
* To perform data retrieval and analysis using SQL.
* To practice SQL joins, aggregate functions, grouping, filtering, and other SQL operations.
* To answer real-world business questions using SQL queries.

---

##  Database Structure

The database contains the following tables:

1. **Hospital**
2. **Department**
3. **Staff**
4. **Doctor**
5. **Patient**
6. **Appointment**
7. **Medical Records**
8. **Prescription**
9. **Medicine**
10. **Lab Test**
11. **Room**
12. **Admission**
13. **Bill**

These tables are connected using primary keys and foreign keys to maintain relationships between different entities.

---

##  Entity Relationship Diagram (ERD)

The ERD represents the structure of the Hospital Management System database and shows the relationships between the tables.

![Hospital Management System ERD](ER_Diagram.png)

---

##  Technologies Used

* **MySQL**
* **MySQL Workbench**
* **SQL**

---

##  SQL Concepts Used

The project includes practical implementation of the following SQL concepts:

* Database creation
* Table creation
* Primary Keys
* Foreign Keys
* Constraints
* INSERT statements
* SELECT statements
* WHERE clause
* DISTINCT
* ORDER BY
* LIMIT
* Aggregate Functions

  * COUNT()
  * SUM()
  * AVG()
  * MIN()
  * MAX()
* GROUP BY
* HAVING
* INNER JOIN
* LEFT JOIN
* Multiple-table joins
* Date filtering
* Date functions
* String functions
* CASE expressions
* COALESCE()
* Subqueries
* Sorting and filtering
* Data analysis using SQL

---

## Project Files

```text
Hospital-Management-SQL-Project/
│
├── README.md
├── Database_and_table.sql
├── Inserting_data.sql
├── Queries.sql
└── ER_Diagram.png
```

### File Description

**Database_and_table.sql**
Contains the SQL statements used to create the database and required tables.

**Inserting_data.sql**
Contains the SQL INSERT statements used to populate the tables with hospital-related records.

**Queries.sql**
Contains SQL queries used to retrieve, filter, join, group, and analyze the data.

**ER_Diagram.png**
Contains the Entity Relationship Diagram showing the database tables and their relationships.

**README.md**
Contains the documentation and overview of the project.

---

##  SQL Analysis and Business Questions

The project uses SQL to answer different real-world hospital management questions, including:

* Display all hospital records.
* Display patients and their information.
* Find patients based on specific conditions such as age.
* Find medicines that expire before a particular date.
* Find the doctor who has handled the highest number of appointments.
* Find the department with the highest number of doctors.
* Count appointments handled by doctors.
* Retrieve patients and their prescriptions.
* Retrieve patient appointment information.
* Calculate the total billing amount for patients.
* Find patients with the highest billing.
* Analyze appointment records.
* Analyze medical records.
* Retrieve medicine and prescription information.
* Perform analysis using GROUP BY and HAVING.
* Use JOIN operations to combine information from multiple tables.
* Perform calculations using aggregate functions.

These queries demonstrate how SQL can be used to solve practical data management and analysis problems in a hospital environment.

---

##  Database Relationships

The database contains relationships between major entities such as:

* A hospital can have multiple departments.
* A department can have multiple doctors and staff members.
* A doctor can handle multiple appointments.
* A patient can have multiple appointments.
* Patients can have medical records.
* Prescriptions are associated with patients and medicines.
* Medical records can contain information related to diagnosis, symptoms, blood pressure, temperature, and other details.
* Patients can undergo laboratory tests.
* Patients can have admissions and room allocations.
* Billing information is maintained for patients and admissions.

These relationships help maintain data consistency and reduce unnecessary duplication of data.

---

## Example SQL Query

Example: Finding the doctor who has handled the highest number of appointments.

```sql
SELECT 
    d.doctor_id,
    COUNT(a.appointment_id) AS count_appoint
FROM appointment a
JOIN doctor d
    ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id
ORDER BY count_appoint DESC
LIMIT 1;
```

This query joins the `doctor` and `appointment` tables, counts the appointments handled by each doctor, sorts the result in descending order, and returns the doctor with the highest appointment count.

---

##  Key Learning Outcomes

Through this project, I gained practical experience in:

* Relational database design.
* Creating and managing tables in MySQL.
* Understanding primary key and foreign key relationships.
* Working with multiple related tables.
* Writing SQL queries for data retrieval.
* Using JOIN operations to combine data.
* Applying aggregate functions for data analysis.
* Grouping and filtering data using GROUP BY and HAVING.
* Solving real-world business questions using SQL.
* Designing and understanding an Entity Relationship Diagram.
* Organizing SQL code into a structured project.

---

##  How to Run the Project

Follow these steps to run the project:

1. Install and open **MySQL Workbench**.
2. Connect to your MySQL server.
3. Open `Database_and_table.sql`.
4. Execute the script to create the database and tables.
5. Open `Inserting_data.sql`.
6. Execute the script to insert the records.
7. Open `Queries.sql`.
8. Execute the required queries to retrieve and analyze the data.

---

##  Project Highlights

* Designed a complete hospital management relational database.
* Created multiple related tables using primary and foreign keys.
* Inserted hospital-related sample data.
* Created an Entity Relationship Diagram.
* Performed SQL operations across multiple tables.
* Used JOINs and aggregate functions for data analysis.
* Solved practical hospital management business questions using SQL.

---

## Author

**Prasad Karande**

This project was developed as a practical SQL project to strengthen my understanding of relational databases, MySQL, and SQL-based data analysis.
Thank You...

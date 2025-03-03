# Employee Performance Mapping - SQL Project

## 📌 Project Overview
This project focuses on analyzing and mapping employee performance at **ScienceQtech**, a startup working in the **Data Science** field. The project includes database creation, querying employee records, calculating performance metrics, and generating reports for HR.

## 📂 Database Schema
The project consists of three tables:

### **1. emp_record_table (Employee Records)**
Stores employee details, including role, department, salary, and ratings.

- **EMP_ID** (Primary Key)
- **FIRST_NAME, LAST_NAME**
- **GENDER, ROLE, DEPT**
- **EXP (Years of Experience)**
- **COUNTRY, CONTINENT**
- **SALARY, EMP_RATING**
- **MANAGER_ID** (Self-referential Foreign Key → EMP_ID)
- **PROJ_ID** (Foreign Key → PROJECT_ID in proj_table)

### **2. proj_table (Projects Information)**
Stores details about projects employees are working on.

- **PROJECT_ID** (Primary Key)
- **PROJ_NAME, DOMAIN**
- **START_DATE, CLOSURE_DATE**
- **DEV_QTR, STATUS**

### **3. data_science_team (Subset of Employees)**
A filtered list of employees working in the Data Science department.

- **EMP_ID** (Primary Key, Foreign Key → EMP_ID in emp_record_table)
- **FIRST_NAME, LAST_NAME, GENDER, ROLE, DEPT**
- **EXP, COUNTRY, CONTINENT**

---

## 🛠️ Steps to Setup the Project

### **1. Clone the Repository**
```bash
git clone https://github.com/your-username/employee-performance-mapping.git
cd employee-performance-mapping
```

### **2. Import the Database**
- Open **MySQL Workbench**
- Create a new database:
  ```sql
  CREATE DATABASE employee;
  USE employee;
  ```
- Import the given CSV files (**data_science_team.csv, proj_table.csv, emp_record_table.csv**) into the `employee` database.

### **3. Create ER Diagram in MySQL Workbench**
- Open **Workbench** → "Database" → "Reverse Engineer"
- Select the `employee` database and generate an ERD
- Define relationships:
  - `emp_record_table.PROJ_ID` → `proj_table.PROJECT_ID`
  - `emp_record_table.MANAGER_ID` → `emp_record_table.EMP_ID` (Self-referential)
  - `data_science_team.EMP_ID` → `emp_record_table.EMP_ID`

---

## 📊 SQL Queries Implemented

### **Basic Queries:**
- Fetch employee details and their department
- Filter employees based on performance rating
- List employees who have direct reports
- Union of employees from Finance & Healthcare departments

### **Aggregations & Calculations:**
- Calculate **maximum and minimum salary** by role
- Assign **ranks based on experience**
- Compute **bonus** for employees (`5% of salary * EMP_RATING`)
- Calculate **average salary distribution** per continent and country

### **Advanced Queries:**
- Create a **view** for employees earning above **6000**
- Use **nested queries** for employees with **>10 years of experience**
- Write a **stored procedure** for employees with **>3 years of experience**
- Implement a **stored function** to classify employees into roles based on experience:
  ```sql
  CASE
    WHEN EXP <= 2 THEN 'JUNIOR DATA SCIENTIST'
    WHEN EXP BETWEEN 3 AND 5 THEN 'ASSOCIATE DATA SCIENTIST'
    WHEN EXP BETWEEN 6 AND 10 THEN 'SENIOR DATA SCIENTIST'
    WHEN EXP BETWEEN 11 AND 12 THEN 'LEAD DATA SCIENTIST'
    WHEN EXP BETWEEN 13 AND 16 THEN 'MANAGER'
  END
  ```
- **Create an index** to improve query performance for finding employees with a given first name.

---

## 🏆 Project Deliverables
- **ER Diagram** (Exported PNG/PDF from MySQL Workbench)
- **SQL Queries**
- **Database Schema Documentation**
- **Performance Analysis Queries**

---

## 📢 Contributors
- **Your Name** (akashsingh9303@gmail.com)

---

## 📜 License
This project is open-source and available under the **MIT License**.

---

🔹 **Happy Querying!** 🚀

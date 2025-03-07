# SQL_Java_Project


## Project Overview
This project is a banking application that focuses on testing a MySQL database after its creation. The application supports verifying customer details, managing accounts, handling transactions, generating reports, and performing dynamic testing using JUnit. Additionally, Apache Spark is integrated for reporting purposes.

## Features
- **Database Testing**: Focus on validating database integrity and constraints.
- **Customer Accounts**: Store and verify customer details and account information.
- **Transactions**: Ensure accurate deposit and withdrawal records.
- **SQL Queries**: Generate and test reports based on customer data.
- **Java Integration**: Java-based interaction with MySQL for testing purposes.
- **JUnit Testing**: Dynamic tests for database validation.
- **Extent Report**: Generate reports using html for data analysis.

## Setup Instructions
### Prerequisites
- Java 17+
- MySQL Community Edition
- Apache Maven (for dependencies)
- Extent Report (for reports)
- An IDE (IntelliJ IDEA)

 ### Database Schema - Draw.io Diagram
- The relational database schema was designed using Draw.io. The schema consists of:
- Customers Table (Stores customer details)
- Accounts Table (Stores checking and savings accounts)
- Transactions Table (Stores deposits and withdrawals)
- The Draw.io ER Diagram can be downloaded from the project repository. 

### Database Setup
1. Install MySQL and create a new database:
   ```sql
   CREATE DATABASE sql_project;
   ```
2. Execute the schema and data scripts in MySQL Workbench:
   ```sql
   SOURCE sql/createTableCustomers.sql;
   SOURCE sql/createTableAccount.sql;
   SOURCE sql/createTableTransactions;
   SOURCE sql/data.sql;(Various queries to add customer information)
   ```
3. Update database credentials in `database/DatabaseConnection.java`.

### Running the Application
1. Compile and run the Java application:
   ```sh
   mvn clean install
   java -jar target/sql_project.jar
   ```
2. Follow on-screen instructions to interact with the application.

### Running Tests
Run JUnit tests using Maven to validate the database:
```sh
mvn test
```

## Database Testing
1. **Customer Count Validation**: Ensure the correct number of customers exist.
2. **Account Verification**: Verify that each customer has the expected accounts.
3. **Transaction Integrity**: Validate transaction correctness, ensuring balances match expected values.
4. **Constraint Testing**: Check primary keys, foreign keys, and other constraints.
5. **Negative Testing**: Attempt invalid operations to confirm constraint enforcement.

## Extent Report Integration
To generate reports using extentReport:
```sh
Integrating ExtentReports into your Java project enhances test reporting by generating interactive, detailed HTML reports that provide insights into test execution. 
```

## Contributors
- Malebo Phosa
- Mbongiseni Phakathi
- Ntokozo Mbuli
- Omphemetse Lekaba

## Acknowledgments
- Special thanks to Inspired Testing for the project inspiration.
- Database Schema designed using Draw.io (Diagrams.net).
- Built with MySQL, Java 17, and JUnit 5.

  


# User Access Management System

This project is a web-based application designed to manage user access to software applications within an organization. It supports user registration, login, software management, access requests, and approvals. The system is built using Java Servlets, JSP, and PostgreSQL.

---

## Features

1. **User Roles**:
   - **Employee**: Can request access to software applications.
   - **Manager**: Can approve/reject access requests.
   - **Admin**: Can create software applications and manage user roles.

2. **Core Functionalities**:
   - User registration and authentication.
   - Software application creation (Admin only).
   - Access request submission (Employee only).
   - Approval or rejection of requests (Manager only).

3. **Technologies Used**:
   - **Backend**: Java Servlets
   - **Frontend**: JavaServer Pages (JSP)
   - **Database**: PostgreSQL
   - **Build Tool**: Maven

---

## Setup Instructions

### Step 1: Clone the Repository

```bash
git clone https://github.com/jagadeesh-nakka/User-Access-Management-System.git
cd User-Access-Management-System
Step 2: Set Up the Database
Open PostgreSQL and create a new database:
sql
Copy code
CREATE DATABASE Rbac;
Use the provided SQL script database_setup.sql to set up tables:
bash
Copy code
psql -U postgres -d Rbac -f database_setup.sql
Verify the following tables are created:

users
software
requests
Add some test data (optional):

sql
Copy code
INSERT INTO users (username, password, role) VALUES ('admin', 'admin123', 'Admin');
Step 3: Configure Project in Eclipse
Import the Project:

Open Eclipse IDE.
Go to File > Import > Maven > Existing Maven Projects.
Select the cloned repository folder and finish the import.
Configure Server:

Add Apache Tomcat Server to Eclipse.
Right-click the project, choose Run As > Run on Server.
Update Database Configuration:

Update the db.properties file with your PostgreSQL credentials:
properties
Copy code
db.url=jdbc:postgresql://localhost:5432/Rbac
db.username=postgres
db.password=root
Step 4: Run the Application
Start the Tomcat server in Eclipse.
Open a browser and navigate to:
Sign Up Page: http://localhost:8080/UserAccessManagement/signup.jsp
Login Page: http://localhost:8080/UserAccessManagement/login.jsp
Project Structure
plaintext
Copy code
src/main/java
├── com.example.useraccess
│   ├── servlets
│   │   ├── SignUpServlet.java
│   │   ├── LoginServlet.java
│   │   ├── SoftwareServlet.java
│   │   ├── RequestServlet.java
│   │   └── ApprovalServlet.java
src/main/webapp
├── signup.jsp
├── login.jsp
├── createSoftware.jsp
├── requestAccess.jsp
├── pendingRequests.jsp
resources
├── db.properties
database
├── database_setup.sql
pom.xml
Testing
Default Credentials
Admin:
Username: admin
Password: admin123
Employee:
Register via the signup page.
Testing Scenarios
Admin creates new software applications.
Employee requests access to software.
Manager approves/rejects the requests.
License
This project is licensed under the MIT License.

Author
Jagadeesh Nakka

javascript
Copy code

This file reflects your GitHub repository link, database name (`Rbac`), username (`postgres`), and password (`root`). Save this content as `README.md` in your project directory, and it will render properly on GitHub.











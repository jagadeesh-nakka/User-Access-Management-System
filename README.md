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
   - Backend: Java Servlets
   - Frontend: JavaServer Pages (JSP)
   - Database: PostgreSQL
   - Build Tool: Maven

---

## Setup Instructions

### Prerequisites

1. **Software Requirements**:
   - Java Development Kit (JDK) 8 or higher
   - Eclipse IDE with Maven Plugin
   - PostgreSQL 12 or higher
   - Apache Tomcat 9.x

2. **Dependencies**:
   Ensure the following dependencies are added to your `pom.xml`:
   ```xml
   <dependencies>
       <dependency>
           <groupId>javax.servlet</groupId>
           <artifactId>javax.servlet-api</artifactId>
           <version>4.0.1</version>
           <scope>provided</scope>
       </dependency>
       <dependency>
           <groupId>org.postgresql</groupId>
           <artifactId>postgresql</artifactId>
           <version>42.3.0</version>
       </dependency>
   </dependencies>

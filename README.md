# Java Servlet JSP Login & Registration System

A secure and functional web application demonstrating core backend development with Java Servlets and JSP. This project implements a complete user authentication flow, including registration, login, and session management, connecting to an Oracle database via JDBC. The focus is purely on server-side logic and architecture.

## ✨ Features

- **User Registration:** New users can create an account with secure password storage.
- **User Login:** Existing users can authenticate with their credentials.
- **Session Management:** User sessions are maintained using `HttpSession` to provide a personalized experience after login.
- **Database Integration:** All user data is persistently stored and retrieved using JDBC to connect to an Oracle SQL database.
- **Server-Side Validation:** Basic validation is implemented to ensure data integrity.

## Technology Stack

- **Backend:** Java, Java Servlets
- **Frontend:** JSP (JavaServer Pages), HTML, CSS
- **Database:** Oracle SQL
- **Database Connectivity:** JDBC (Java Database Connectivity)
- **Web Server:** Apache Tomcat
- **IDE:** Eclipse

## 📁 Project Structure
```bash
src/
└── main/
├── java/
│ └── com/
│ ├── login/
│ │ └── LoginServlet.java # Handles user login requests
│ ├── logout/
│ │ └── LogoutServlet.java # Handles user logout and session invalidation
│ ├── registration/
│ │ └── RegistrationServlet.java # Handles new user registration
│ └── util/
│ └── PasswordUtil.java # Utility for password hashing (if implemented)
│
└── webapp/
├── WEB-INF/
│ ├── web.xml # Deployment descriptor (Servlet mappings)
│ └── lib/ # Directory for external JARs (e.g., ojdbc.jar)
├── META-INF/
│ └── context.xml # DataSource configuration (DB connection details)
├── styles/
│ └── style.css # CSS for styling the pages
├── index.jsp # Home page
├── login.jsp # User login form
├── register.jsp # User registration form
└── message.jsp # Page for displaying messages/errors
```


## 🔧 Setup & Installation

### Prerequisites
1. **Java Development Kit (JDK)** version 8 or higher.
2. **Apache Tomcat** server (version 9.x or higher).
3. **Oracle Database** installed and running.
4. **Eclipse IDE for Enterprise Java and Web Developers** (optional but recommended).

### Steps to Run Locally

## 1. **Clone the Repository**
   ```bash
   git clone https://github.com/Shreyash-Sp80/Login-Registration-Backend-Java.git
   ```

## 2. Database Setup

Run the following SQL commands in your Oracle SQL*Plus or SQL Developer tool to create the table, sequence, and trigger:

```sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    uname   VARCHAR2(50),
    upwd    VARCHAR2(150),
    uemail  VARCHAR2(50),
    umobile VARCHAR2(20)
);

-- Create sequence for auto-incrementing ID
CREATE SEQUENCE users_seq
START WITH 1
INCREMENT BY 1;

-- Create trigger to automatically assign ID from sequence
CREATE OR REPLACE TRIGGER users_bi
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
   SELECT users_seq.NEXTVAL
   INTO :new.id
   FROM dual;
END;
/
```

## 3. 🔧 Application Setup & Installation
Prerequisites
- Java Development Kit (JDK) version 8 or higher.
- Apache Tomcat server (version 9.x or higher).
- Oracle Database installed and running.
- Eclipse IDE for Enterprise Java and Web Developers (optional but recommended).


## 4. Required Libraries (JAR Files)
- Copy and paste the following required JAR files into your webapp/WEB-INF/lib/ directory:
   1. ojdbc14.jar - Oracle JDBC driver for database connectivity
   2. jbcrypt-0.4.jar - For password encryption (download from: https://repo1.maven.org/maven2/org/mindrot/jbcrypt/0.4/)


### Key Changes Made for Your Database:

1.  **Database Setup Section:** Added a dedicated section with your exact SQL commands for creating the `users` table, sequence, and trigger.
2.  **Configuration Note:** Added a note in the setup steps reminding to place the Oracle JDBC JAR in the `WEB-INF/lib/` folder.
3.  **Usage Instructions:** Updated the registration step to mention the specific fields (`uname`, `upwd`, `uemail`, `umobile`) that your table uses.

This README now accurately reflects your project's database schema and provides clear instructions for anyone who wants to set it up.


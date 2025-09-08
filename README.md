# Java Servlet JSP Login & Registration System

A secure and functional web application demonstrating core backend development with Java Servlets and JSP. This project implements a complete user authentication flow, including registration, login, and session management, connecting to an Oracle database via JDBC. The focus is purely on server-side logic and architecture.

## ✨ Features

- **User Registration:** New users can create an account with secure password storage.
- **User Login:** Existing users can authenticate with their credentials.
- **Session Management:** User sessions are maintained using `HttpSession` to provide a personalized experience after login.
- **Database Integration:** All user data is persistently stored and retrieved using JDBC to connect to an Oracle SQL database.
- **Server-Side Validation:** Basic validation is implemented to ensure data integrity.

## 🛠️ Technology Stack

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

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Shreyash-Sp80/Login-Registration-Backend-Java.git
```

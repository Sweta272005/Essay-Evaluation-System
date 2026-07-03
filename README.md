# 📚 Essay Evaluation & Plagiarism Detection System

A web-based application developed using **Java Servlets, JSP, JDBC, and MySQL** that automates essay evaluation by calculating word count, assigning grades, and performing basic plagiarism detection.

---

## 🚀 Features

- ✍️ Submit essays through a user-friendly web interface
- 📊 Automatic word count calculation
- 🏆 Grade assignment based on predefined criteria
- 🔍 Basic plagiarism detection by comparing submitted essays with existing records
- 💾 Store essay details in a MySQL database
- 📋 View all submitted essays along with evaluation results

---

## 🛠️ Technologies Used

- **Programming Language:** Java
- **Frontend:** JSP, HTML, CSS
- **Backend:** Java Servlets
- **Database:** MySQL
- **Database Connectivity:** JDBC
- **Web Server:** Apache Tomcat 9
- **IDE:** Eclipse IDE

---

## 📂 Project Structure

```
EssayProject/
│
├── src/
│   ├── db/
│   │   └── DBConnection.java
│   └── servlet/
│       └── EssayServlet.java
│
├── WebContent/
│   ├── index.jsp
│   ├── result.jsp
│   ├── view.jsp
│   └── WEB-INF/
│
└── build/
```

---

## ⚙️ How to Run

### 1. Clone the repository

```bash
git clone https://github.com/Sweta272005/Essay-Evaluation-System.git
```

### 2. Import the project

- Open Eclipse IDE
- Go to **File → Import → Existing Projects into Workspace**
- Select the cloned project folder

### 3. Configure Apache Tomcat

- Add Apache Tomcat 9 to Eclipse
- Deploy the project on the server

### 4. Configure MySQL

Create the database:

```sql
CREATE DATABASE essay_db;

USE essay_db;

CREATE TABLE essays (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT,
    word_count INT,
    grade VARCHAR(20),
    plagiarism DOUBLE
);
```

### 5. Update Database Credentials

Open:

```
src/main/java/db/DBConnection.java
```

Update:

```java
username
password
```

according to your MySQL configuration.

### 6. Run the Project

Open your browser:

```
http://localhost:8080/EssayProject/index.jsp
```

---

## 📸 Screenshots

### Home Page

![Uploading image.png…]()


### Result Page

<img width="2220" height="822" alt="image" src="https://github.com/user-attachments/assets/00d4c932-9c41-4e7b-93d0-8b9fc690a15c" />


### View Essays

<img width="2284" height="1606" alt="image" src="https://github.com/user-attachments/assets/3846abc2-dc06-4125-a061-dfe523496fec" />


---

## 🔮 Future Enhancements

- AI-based essay grading
- Advanced plagiarism detection using NLP
- User authentication and authorization
- Cloud deployment
- Analytics dashboard
- Responsive UI improvements

---

## 🎯 Learning Outcomes

This project helped me gain practical experience in:

- Java Web Development
- Java Servlets & JSP
- JDBC Database Connectivity
- MySQL Database Management
- Apache Tomcat Deployment
- Git & GitHub
- CRUD Operations
- Client-Server Architecture

---

## 👩‍💻 Author

**Sweta Yadav**

B.Tech – Computer Science & Engineering

GitHub: https://github.com/Sweta272005

---

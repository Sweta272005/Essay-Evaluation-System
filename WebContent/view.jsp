<%@ page import="java.sql.*" %>
<%@ page import="db.DBConnection" %>

<html>
<head>
    <title>All Essays</title>
    <style>
        body {
            font-family: Arial;
            text-align: center;
            background-color: #f2f2f2;
        }
        table {
            margin: auto;
            border-collapse: collapse;
            width: 80%;
            background: white;
        }
        th, td {
            padding: 10px;
            border: 1px solid black;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>

<body>

<h2>All Essays</h2>

<table>
<tr>
    <th>ID</th>
    <th>Content</th>
    <th>Word Count</th>
    <th>Grade</th>
    <th>Plagiarism (%)</th>
</tr>

<%
    try {
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery("SELECT * FROM essays");

        while(rs.next()) {
%>

<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("content") %></td>
    <td><%= rs.getInt("word_count") %></td>
    <td><%= rs.getString("grade") %></td>
    <td><%= String.format("%.2f", rs.getDouble("plagiarism")) %></td>
</tr>

<%
        }
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
%>

</table>

<br><br>
<a href="index.jsp"> Back to Home</a>

</body>
</html>
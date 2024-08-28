<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.example.chatapp.model.User" %>
<%@ page session="true" %>
<%
    // Retrieve the logged-in user from the session
    User user = (User) session.getAttribute("user");
    
    // Redirect to login page if the user is not logged in
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home - ChatApp</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
        }
    </style>
</head>
<body>
    <header>
        <h1>Welcome to ChatApp, <c:out value="${user.username}"/>!</h1>
    </header>

    <nav>
        <ul>
            <li><a href="chat.jsp">Chat</a></li>
            <li><a href="camera.jsp">Camera</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </nav>

    <main>
        <p>This is your home page. From here, you can start chatting with others or use the camera feature.</p>
    </main>

    <footer>
        <p>&copy; 2024 ChatApp</p>
    </footer>
</body>
</html>

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
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f4;
        }
        header {
            background: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        nav {
            background: #444;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: center;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
        }
        nav ul li {
            margin: 0 15px;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
        nav ul li a:hover {
            text-decoration: underline;
        }
        main {
            flex: 1;
            max-width: 800px;
            margin: auto;
            background: #ffffff;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            margin-bottom: 100px;
            position: relative;
        }
        .message-box {
            position: relative;
            background: #e0e0e0;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .message-box:before {
            content: '';
            position: absolute;
            bottom: -20px;
            left: 20px;
            width: 0;
            height: 0;
            border-left: 20px solid transparent;
            border-top: 20px solid #e0e0e0;
            border-right: 20px solid transparent;
        }
        .highlight {
            color: #007bff;
            font-weight: bold;
        }
        footer {
            background: #333;
            color: white;
            padding: 10px;
            text-align: center;
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
            <li><a href="logout">Logout</a></li>
        </ul>
    </nav>

    <main>
        <div class="message-box">
            <p>Welcome to <span class="highlight">ChatApp</span>, where conversations come to life! Imagine a place where every message you send feels like a personal note, and every chat you join opens the door to new friendships and collaborations. At ChatApp, we're more than just a messaging platform—we're a vibrant community built for connection and collaboration. Whether you're brainstorming with colleagues, catching up with old friends, or meeting new people, ChatApp transforms every interaction into a meaningful experience. Dive into an intuitive, user-friendly environment that adapts to your needs and makes communication effortless. Discover a space where every conversation sparks innovation, and every chat brings you closer to your goals. Ready to experience the future of messaging? Welcome to ChatApp—where every chat matters.</p>
        </div>
    </main>

    <footer>
        <p>&copy; 2024 ChatApp</p>
    </footer>
</body>
</html>

<%@page import="com.example.chatapp.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<html>
<head>
    <title>Chat - ChatApp</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .chat-container {
            flex: 1;
            display: flex;
            flex-direction: column;
            max-width: 800px;
            margin: auto;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            margin-top: 20px;
        }
        #messages {
            list-style-type: none;
            padding: 0;
            margin: 0;
            overflow-y: auto;
            flex: 1;
            border-bottom: 1px solid #ddd;
            padding: 10px;
        }
        #messages li {
            margin-bottom: 10px;
        }
        .message {
            padding: 10px;
            border-radius: 5px;
            background: #e0e0e0;
        }
        .message strong {
            display: block;
        }
        .chat-input {
            padding: 10px;
            border-top: 1px solid #ddd;
            display: flex;
            align-items: center;
        }
        #message {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }
        button {
            padding: 10px;
            margin-left: 10px;
            background: #5cb85c;
            border: none;
            color: white;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background: #4cae4c;
        }
        .return-home-button {
            margin: 10px;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            text-align: center;
            display: block;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
            text-decoration: none;
        }
        .return-home-button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <a href="home.jsp" class="return-home-button">Return to Home</a>
        <ul id="messages"></ul>
        <div class="chat-input">
            <input type="text" id="message" placeholder="Type your message..."/>
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>
    <script>
        // Embed the username into JavaScript
        var username = "<c:out value='${user.username}'/>";
        var ws = new WebSocket("ws://" + window.location.host + "/Assignment/chat");

        ws.onmessage = function(event) {
            var message = JSON.parse(event.data);

            var li = document.createElement("li");
            li.classList.add("message");
            li.innerHTML = "<strong>" + message.user + ":</strong> " + message.message;

            document.getElementById("messages").appendChild(li);
        };

        function sendMessage() {
            var message = document.getElementById("message").value.trim(); // Remove leading/trailing whitespace

            if (message === "") {
                alert("Message cannot be empty!");
                return;
            }

            var jsonMessage = {
                user: username,
                message: message
            };

            ws.send(JSON.stringify(jsonMessage));
            document.getElementById("message").value = ''; // Clear the input field after sending
        }
    </script>
</body>
</html>

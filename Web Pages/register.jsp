<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Register</title>
        <style>
            /* Basic styling for the form */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f4f4f4;
            }

            form {
                background: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px; /* Fixed width for the form to ensure inputs and button align */
            }

            input[type="text"], input[type="password"], input[type="submit"] {
                width: 100%; /* Ensure all inputs and button take the full width of the form */
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 3px;
                box-sizing: border-box; /* Include padding and border in the element's width */
            }

            input[type="submit"] {
                background: #5cb85c;
                border: none;
                color: white;
                cursor: pointer;
            }

            input[type="submit"]:hover {
                background: #4cae4c;
            }

            .error {
                color: red;
            }

            .success {
                color: green;
            }
        </style>
    </head>
    <body>

        <form action="register" method="post">
            <h2>Register</h2>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register">

            <!-- Display error or success messages -->
            <div class="error">
                <% String error = request.getParameter("error");
            if (error != null) {%>
                <p><%= error%></p>
                <% } %>
            </div>

            <div class="success">
                <% String message = request.getParameter("message");
            if (message != null) {%>
                <p><%= message%></p>
                <% }%>
            </div>

            <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
        </form>

    </body>
</html>

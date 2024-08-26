package com.example.chatapp.servlets;

import com.example.chatapp.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {

    private UserService userService;

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialize the UserService which will handle the registration logic
        userService = new UserService();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the username and password from the registration form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Simple validation to check if input fields are not null or empty
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            // Redirect to the registration page with an error message if inputs are invalid
            response.sendRedirect("register.jsp?error=Invalid input");
            return;
        }

        // Use the UserService to attempt to register the user
        boolean success = userService.registerUser(username, password);

        if (success) {
            // If registration is successful, redirect to the login page with a success message
            response.sendRedirect("login.jsp?message=Registration successful! Please log in.");
        } else {
            // If the username is already taken, redirect back to the registration page with an error message
            response.sendRedirect("register.jsp?error=Username already exists");
        }
    }
}

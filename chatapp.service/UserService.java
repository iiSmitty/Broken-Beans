package com.example.chatapp.service;

import com.example.chatapp.model.User;

import java.util.HashMap;
import java.util.Map;

public class UserService {

    private Map<String, String> userDatabase;

    public UserService() {
        userDatabase = new HashMap<>();
        // Optionally, pre-load some users for testing purposes
        userDatabase.put("admin", "password");
    }

    public boolean registerUser(String username, String password) {
        if (userDatabase.containsKey(username)) {
            return false; // User already exists
        }
        userDatabase.put(username, password);
        return true;
    }

    public User authenticateUser(String username, String password) {
        String storedPassword = userDatabase.get(username);
        if (storedPassword != null && storedPassword.equals(password)) {
            return new User(username, password);
        }
        return null;
    }
}

package com.example.chatapp.websocket;

import java.io.StringReader;
import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/chat")
public class ChatEndpoint {

    @OnOpen
    public void onOpen(Session session) {
        System.out.println("New connection with client with ID: " + session.getId());
    }
    
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            JsonObject jsonMessage = Json.createReader(new StringReader(message)).readObject();
            
            String userName = jsonMessage.getString("user");
            String userMessage = jsonMessage.getString("message");
            
            JsonObject jsonResponse = Json.createObjectBuilder()
                .add("user", userName)
                .add("message", userMessage)
                .build();
            
            for (Session s: session.getOpenSessions()) {
                s.getBasicRemote().sendText(jsonResponse.toString());
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

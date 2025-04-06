package com.example.usedbooks.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.Date;
import java.time.LocalDateTime;  
import java.time.ZoneId;  

@Document(collection = "notifications")
public class Notification {
    @Id
    private String id;
    private String userId;
    private String message;
    private Date createdAt;  // Store as Date for MongoDB compatibility

    public Notification() {}

    public Notification(String userId, String message) {
        this.userId = userId;
        this.message = message;
        this.createdAt = new Date();  // Set current time when creating a new notification
    }

    // Getters and Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    // This method is used for processing `createdAt` as LocalDateTime
    public void setCreatedAtFromLocalDateTime(LocalDateTime localDateTime) {
        this.createdAt = Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }
}

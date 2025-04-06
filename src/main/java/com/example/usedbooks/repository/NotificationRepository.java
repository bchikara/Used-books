package com.example.usedbooks.repository;

import com.example.usedbooks.model.Notification;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Date;  // Use Date instead of LocalDateTime
import java.util.List;

public interface NotificationRepository extends MongoRepository<Notification, String> {
    // Change LocalDateTime to Date in the query method
    List<Notification> findByUserIdAndCreatedAtAfter(String userId, Date after);
}

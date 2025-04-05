package com.example.usedbooks.repository;

import com.example.usedbooks.model.Notification;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface NotificationRepository extends MongoRepository<Notification, String> {
    List<Notification> findByUserIdAndCreatedAtAfter(String userId, LocalDateTime after);
}

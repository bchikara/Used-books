package com.example.usedbooks.notification;

import com.example.usedbooks.model.Notification;
import com.example.usedbooks.repository.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserObserverImpl implements Observer {

    private String userId;
    private final NotificationRepository notificationRepository;

    @Autowired
    public UserObserverImpl(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @Override
    public void update(String message) {
        Notification notification = new Notification(userId, message);
        notificationRepository.save(notification);
    }
}

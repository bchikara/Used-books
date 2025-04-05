package com.example.usedbooks.notification;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.*;

@Component  // ✅ Register as a Spring bean
public class NotificationManager {

    private final Map<String, List<Observer>> observers = new HashMap<>();

    @Autowired
    private ApplicationContext applicationContext;

    public void subscribe(String bookId, String userId) {
        UserObserverImpl observer = applicationContext.getBean(UserObserverImpl.class);
        observer.setUserId(userId);
        observers.computeIfAbsent(bookId, k -> new ArrayList<>()).add(observer);
    }

    public void notifyUsers(List<String> userIds, String bookTitle) {
        for (String userId : userIds) {
            UserObserverImpl observer = applicationContext.getBean(UserObserverImpl.class);
            observer.setUserId(userId);
            observer.update("📚 A book you're waiting for is now available: " + bookTitle);
        }
    }

    public void clearObservers(String bookId) {
        observers.remove(bookId);
    }
}

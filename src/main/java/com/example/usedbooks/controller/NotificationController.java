package com.example.usedbooks.controller;

import com.example.usedbooks.model.Notification;
import com.example.usedbooks.model.User;
import com.example.usedbooks.repository.NotificationRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.util.List;

@Controller
public class NotificationController {

    @Autowired
    private NotificationRepository notificationRepository;

    @GetMapping("/books/notifications")
    public String showNotifications(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/signin";
        }

        // ✅ Filter notifications that are not older than 5 minutes
        List<Notification> books = notificationRepository.findByUserIdAndCreatedAtAfter(
                user.getId(), LocalDateTime.now().minusMinutes(5)
        );

        model.addAttribute("books", books);
        return "notifications";
    }
}

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
import java.util.Date;
import java.util.List;
import java.time.ZoneId;

@Controller
public class NotificationController {

    @Autowired
    private NotificationRepository notificationRepository;

    @GetMapping("/books/notifications")
    public String showNotifications(HttpSession session, Model model) {
        var user = (com.example.usedbooks.model.User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/signin";
        }

        // Get current time and subtract 24 hours
        LocalDateTime cutoff = LocalDateTime.now().minusHours(24);

        // Convert LocalDateTime to Date for MongoDB comparison
        Date cutoffDate = convertToDate(cutoff);

        // Fetch only fresh notifications
        List<Notification> recentNotifications =
                notificationRepository.findByUserIdAndCreatedAtAfter(user.getId(), cutoffDate);

        // Convert Date to LocalDateTime for display in the model (if necessary)
        for (Notification notification : recentNotifications) {
            LocalDateTime createdAtAsLocalDateTime = convertToLocalDateTime(notification.getCreatedAt());
            notification.setCreatedAtFromLocalDateTime(createdAtAsLocalDateTime); // Optional, depending on usage
        }

        model.addAttribute("notifications", recentNotifications);
        return "notifications";
    }

    // Convert LocalDateTime to Date (for MongoDB compatibility)
    private Date convertToDate(LocalDateTime localDateTime) {
        return Date.from(localDateTime.atZone(ZoneId.systemDefault()).toInstant());
    }

    // Convert Date to LocalDateTime (for Java processing)
    private LocalDateTime convertToLocalDateTime(Date date) {
        return date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
    }
}

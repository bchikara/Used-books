package com.example.usedbooks.controller;

import com.example.usedbooks.model.User;
import com.example.usedbooks.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

@GetMapping("/")
public String homeRedirect(HttpSession session, HttpServletRequest request) {
    System.out.println("Request to / from IP: " + request.getRemoteAddr());
    System.out.println("User session: " + session.getAttribute("user"));
    return (session.getAttribute("user") != null) ? "redirect:/books/inventory" : "redirect:/signin";
}



    @GetMapping("/signin")
    public String loginPage() {
        return "login";
    }

    @PostMapping("/signin")
    public String login(@RequestParam String email, @RequestParam String password,
                        HttpSession session, Model model) {
        User user = userService.login(email, password);
        if (user != null) {
            session.setAttribute("user", user);
            return "redirect:/books/inventory";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "login";
        }
    }

    @GetMapping("/signup")
    public String signupPage() {
        return "register";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String name, @RequestParam String email,
                         @RequestParam String password, Model model) {
        User user = userService.register(name, email, password);
        if (user == null) {
            model.addAttribute("error", "User already exists");
            return "register";
        }
        return "redirect:/signin";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/signin";
    }
}

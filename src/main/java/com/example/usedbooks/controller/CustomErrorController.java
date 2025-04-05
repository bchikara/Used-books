package com.example.usedbooks.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.boot.web.servlet.error.ErrorController;

@Controller
public class CustomErrorController implements ErrorController {

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        return "error"; // make sure /WEB-INF/views/error.jsp exists
    }

    public String getErrorPath() {
        return "/error";
    }
}

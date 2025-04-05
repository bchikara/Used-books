package com.example.usedbooks.controller;

import com.example.usedbooks.model.Book;
import com.example.usedbooks.model.User;
import com.example.usedbooks.service.BookService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.example.usedbooks.model.Notification;
import com.example.usedbooks.repository.NotificationRepository;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/books")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
private NotificationRepository notificationRepository;

    @GetMapping("/inventory")
public String getInventory(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) return "redirect:/signin";
    List<Book> books = bookService.getInventory(user.getId());
    model.addAttribute("books", books);
    model.addAttribute("user", user);
    return "inventory";
}

@GetMapping("/myBooks")
public String getMyBooks(Model model, HttpSession session) {
    User user = (User) session.getAttribute("user");

    if (user == null) {
        return "redirect:/signin";
    }



    // 🛡️ Prevent NullPointerException
    List<Book> books = bookService.getUserBooks(user.getId());

    if (books == null) {
        books = new ArrayList<>(); // ✅ return empty list to avoid errors in view
    }

    model.addAttribute("books", books);
    model.addAttribute("user", user);
    return "mybooks";
}

@PostMapping("/notify")
    public String notifyMe(@RequestParam String id, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/signin";

        bookService.requestNotification(id, user.getId());
        redirectAttributes.addFlashAttribute("message", "✅ You'll be notified when this book is available.");
        return "redirect:/books/inventory";
    }




    @PostMapping("/buy")
    public String buyBook(@RequestParam String id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/signin";
        boolean result = bookService.buyBook(id, user.getId());
        model.addAttribute("message", result ? "Book purchased!" : "Book not available.");
        return "redirect:/books/inventory";
    }

    @GetMapping("/sell")
    public String showSellForm(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user == null ? "redirect:/signin" : "sell";
    }

    @PostMapping("/sell/existing")
    public String sellExistingBook(@RequestParam String id, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/signin";
        double price = bookService.sellBookById(id, user.getId());
        model.addAttribute("message", price >= 0 ? "Book resold at: $" + price : "Failed to resell.");
        return "redirect:/books/myBooks";
    }

    @GetMapping("/add")
public String showAddBookForm(HttpSession session) {
    User user = (User) session.getAttribute("user");
    return user == null ? "redirect:/signin" : "addbook";  // <- must return a JSP view
}

@PostMapping("/unsell")
public String unsellBook(@RequestParam String id, HttpSession session) {
    User user = (User) session.getAttribute("user");
    if (user == null) return "redirect:/signin";
    bookService.unsellBook(id, user.getId());
    return "redirect:/books/myBooks";
}



    @PostMapping("/sell/new")
    public String sellNewBook(@RequestParam String isbn, @RequestParam String author,
                              @RequestParam String title, @RequestParam String edition,
                              @RequestParam double price, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/signin";
        double newPrice = bookService.sellBookByIsbn(isbn, author, title, edition, price, user.getId());
        model.addAttribute("message", "New book added at: $" + newPrice);
        return "redirect:/books/myBooks";
    }
}
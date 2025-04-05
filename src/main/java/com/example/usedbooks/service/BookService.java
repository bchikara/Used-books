package com.example.usedbooks.service;

import com.example.usedbooks.model.Book;
import com.example.usedbooks.model.BookStatus;
import com.example.usedbooks.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.usedbooks.notification.NotificationManager;
import com.example.usedbooks.notification.UserObserverImpl;
import java.util.*;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;
      @Autowired
private NotificationManager notificationManager;


    // 📦 Get all inventory books excluding current user’s own listings
    public List<Book> getInventory(String excludeUserId) {
        List<Book> all = bookRepository.findByStatusIn(List.of(BookStatus.LISTED, BookStatus.PREOWNED));
        List<Book> filtered = new ArrayList<>();
        for (Book book : all) {
            if (!excludeUserId.equals(book.getOwnerId())) {
                filtered.add(book);
            }
        }
        return filtered;
    }

    // 📚 Get all books owned by a user
    public List<Book> getUserBooks(String userId) {
        return bookRepository.findByOwnerId(userId);
    }

    // 🛒 Buy a book => assign ownership and mark as PREOWNED
    public boolean buyBook(String bookId, String buyerId) {
        Optional<Book> optional = bookRepository.findById(bookId);
        if (optional.isPresent()) {
            Book book = optional.get();

            // ❌ Prevent buying own book or unavailable ones
            if (!book.getStatus().equals(BookStatus.LISTED) || buyerId.equals(book.getOwnerId())) return false;

            book.setStatus(BookStatus.PREOWNED);
            book.setOwnerId(buyerId);
            bookRepository.save(book);
            return true;
        }
        return false;
    }

    // 🆕 Sell new book => goes to preOwned state
    public double sellBookByIsbn(String isbn, String author, String title, String edition, double price, String sellerId) {
        Book book = new Book();
        book.setId(UUID.randomUUID().toString());
        book.setIsbn(isbn);
        book.setAuthor(author);
        book.setTitle(title);
        book.setEdition(edition);
        book.setPrice(price);
        book.setOriginalPrice(price); // ✅ Store original price
        book.setTransactionCount(1);
        book.setStatus(BookStatus.PREOWNED); // Not in inventory yet
        book.setOwnerId(sellerId);
        book.setNotifyUserIds(new HashSet<>());
        bookRepository.save(book);
        return price;
    }

  
public double sellBookById(String bookId, String userId) {
    Optional<Book> optional = bookRepository.findById(bookId);
    if (optional.isPresent()) {
        Book book = optional.get();
        if (!userId.equals(book.getOwnerId()) || book.getStatus() != BookStatus.PREOWNED) {
            return -1;
        }

        double floorPrice = book.getOriginalPrice() * 0.5;
        double newPrice = Math.max(book.getPrice() * 0.9, floorPrice);

        book.setStatus(BookStatus.LISTED);
        book.setPrice(newPrice);
        book.setTransactionCount(book.getTransactionCount() + 1);

        bookRepository.save(book);

        System.out.print("Test "+new ArrayList<>(book.getNotifyUserIds()) + book.getTitle());





        // 🔔 Notify interested users
        notificationManager.notifyUsers(new ArrayList<>(book.getNotifyUserIds()), book.getTitle());
        book.setNotifyUserIds(new HashSet<>());
        bookRepository.save(book);

        return newPrice;
    }
    return -1;
}


    // 🔄 Unlist a book from inventory => move back to preOwned
    public void unsellBook(String bookId, String userId) {
        Optional<Book> optional = bookRepository.findById(bookId);
        if (optional.isPresent()) {
            Book book = optional.get();
            if (userId.equals(book.getOwnerId()) && book.getStatus() == BookStatus.LISTED) {
                book.setStatus(BookStatus.PREOWNED);
                bookRepository.save(book);
            }
        }
    }

    // 🔔 Request notification if a book is unavailable
    public void requestNotification(String bookId, String userId) {
    Optional<Book> optional = bookRepository.findById(bookId);
    if (optional.isPresent()) {
        Book book = optional.get();
        if (book.getStatus() != BookStatus.LISTED) {
            // Save userId to DB for visibility
            Set<String> notifyList = book.getNotifyUserIds();
            if (notifyList == null) notifyList = new HashSet<>();
            notifyList.add(userId);
            book.setNotifyUserIds(notifyList);
            bookRepository.save(book);

            // Register observer
            notificationManager.subscribe(bookId, userId);
        }
    }
}
}

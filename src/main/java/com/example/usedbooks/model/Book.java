package com.example.usedbooks.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import java.util.HashSet;
import java.util.Set;

@Document(collection = "books")
public class Book {

    @Id
    private String id;

    private String isbn;
    private String author;
    private String title;
    private String edition;
    private double price;
    private double originalPrice;
    private int transactionCount;
    private String ownerId;

    private BookStatus status;
    private Set<String> notifyUserIds = new HashSet<>();

    public Book() {}

    // Getters and setters

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getEdition() { return edition; }
    public void setEdition(String edition) { this.edition = edition; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getOriginalPrice() { return originalPrice; }
    public void setOriginalPrice(double originalPrice) { this.originalPrice = originalPrice; }

    public int getTransactionCount() { return transactionCount; }
    public void setTransactionCount(int transactionCount) { this.transactionCount = transactionCount; }

    public String getOwnerId() { return ownerId; }
    public void setOwnerId(String ownerId) { this.ownerId = ownerId; }

    public BookStatus getStatus() { return status; }
    public void setStatus(BookStatus status) { this.status = status; }

    public Set<String> getNotifyUserIds() { return notifyUserIds; }
    public void setNotifyUserIds(Set<String> notifyUserIds) { this.notifyUserIds = notifyUserIds; }
}
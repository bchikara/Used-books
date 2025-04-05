package com.example.usedbooks.repository;

import com.example.usedbooks.model.Book;
import org.springframework.data.mongodb.repository.MongoRepository;
import com.example.usedbooks.model.BookStatus;

import java.util.List;

public interface BookRepository extends MongoRepository<Book, String> {
  
    List<Book> findByOwnerId(String ownerId);
List<Book> findByStatusIn(List<BookStatus> statuses);

    List<Book> findByNotifyUserIdsContaining(String userId);
}

# 📚 UsedBooks WebApp

A full-stack Java web application for a used textbook resale system. Students can buy, sell, and request notifications for books. Implements clean UI using JSP and Tailwind, with MongoDB for persistence and Spring Boot for backend logic.

---

## ✨ Features

- 👤 User authentication (Sign In / Sign Up)
- 📦 List and buy used textbooks
- 🔁 Resell books with automatic depreciation (min 50% original price)
- 🔔 "Notify Me" feature for unavailable books
- ⏰ Notification system with 5-minute expiry (Observer Pattern)
- 📈 Dynamic inventory filtering
- 🖼️ Modern UI styled with Tailwind CSS

---

## 🧠 Design Patterns

- ✅ **Observer Pattern**: Used for notification requests and handling timed notification delivery via `NotificationManager`, `Observer`, and `UserObserverImpl`.

---

## 📂 Project Structure

```
used-books-webapp/
│
├── controller/
│   ├── BookController.java
│   └── NotificationController.java
│
├── model/
│   ├── Book.java
│   ├── BookStatus.java
│   └── Notification.java
│
├── notification/
│   ├── NotificationManager.java
│   ├── Observer.java
│   └── UserObserverImpl.java
│
├── repository/
│   ├── BookRepository.java
│   └── NotificationRepository.java
│
├── service/
│   └── BookService.java
│
├── views/
│   ├── inventory.jsp
│   ├── myBooks.jsp
│   ├── addBook.jsp
│   ├── notifications.jsp
│   └── common/header.jsp
│
├── static/
│   ├── css/
│   └── images/
│
└── README.md
```

---

## ⚙️ Setup Instructions

1. ✅ Install [Java 17+](https://adoptium.net/)
2. ✅ Install [Maven](https://maven.apache.org/)
3. ✅ Start local MongoDB instance
4. ✅ Run the project:

```bash
mvn spring-boot:run
```

5. ✅ Access the app at: `http://localhost:8080`

---

## 🙋 Author

Made by Bhupesh Chikara – with ☕, Tailwind, and Spring Boot.
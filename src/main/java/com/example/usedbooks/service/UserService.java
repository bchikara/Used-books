package com.example.usedbooks.service;

import com.example.usedbooks.model.User;
import com.example.usedbooks.repository.UserRepository;
import com.example.utils.AesEncryptor;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    

    public User register(String name, String email, String password) {
        if (userRepository.findByEmail(email) != null) {
            return null; // User already exists
        }
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(AesEncryptor.encrypt(password));
        return userRepository.save(user);
    }

    public User login(String email, String rawPassword) {
        User user = userRepository.findByEmail(email);
        
        System.out.println("hello"+AesEncryptor.decrypt(user.getPassword()));
        if (user != null && rawPassword.equals(AesEncryptor.decrypt(user.getPassword()))) {
            return user;
        }
        return null;
    }
}
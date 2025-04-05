package com.example.utils;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.stereotype.Component;

import java.util.Base64;

@Component
public class AesEncryptor {

    // Must be 16 bytes for AES-128, 24 for AES-192, or 32 for AES-256
    private static final String SECRET_KEY = "1234567890123456"; // 16 chars = 128-bit

    private static final String ALGORITHM = "AES";

    // Encrypt plain text
    public static String encrypt(String plainText) {
        try {
            SecretKeySpec key = new SecretKeySpec(SECRET_KEY.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, key);

            byte[] encrypted = cipher.doFinal(plainText.getBytes());
            return Base64.getEncoder().encodeToString(encrypted);

        } catch (Exception e) {
            throw new RuntimeException("Error while encrypting: " + e.getMessage());
        }
    }

    // Decrypt encrypted text
    public static String decrypt(String encryptedText) {
        try {
            SecretKeySpec key = new SecretKeySpec(SECRET_KEY.getBytes(), ALGORITHM);
            Cipher cipher = Cipher.getInstance(ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, key);

            byte[] decoded = Base64.getDecoder().decode(encryptedText);
            byte[] decrypted = cipher.doFinal(decoded);
            return new String(decrypted);

        } catch (Exception e) {
            throw new RuntimeException("Error while decrypting: " + e.getMessage());
        }
    }
}

package ru.itis.websportreboot.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UserUtils {

    public static String makeDigest(String s) {
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        messageDigest.reset();
        messageDigest.update(s.getBytes());
        byte[] digest = messageDigest.digest();

        StringBuilder hexString = new StringBuilder();
        for (byte b : digest) {
            hexString.append(Integer.toHexString(0xFF & b));
        }
        return hexString.toString();
    }
}

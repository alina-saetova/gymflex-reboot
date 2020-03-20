package ru.itis.websportreboot.service;

public interface EmailService {

    void sendEmail(String subject, String text, String email);
}

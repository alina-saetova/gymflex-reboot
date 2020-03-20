package ru.itis.websportreboot.service;

public interface SignInService {

    String signIn(String email, String password, String remember);
}

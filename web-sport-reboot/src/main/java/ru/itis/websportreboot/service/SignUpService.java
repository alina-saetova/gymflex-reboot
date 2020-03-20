package ru.itis.websportreboot.service;

import ru.itis.websportreboot.dto.SignUpDto;

public interface SignUpService {

    void signUp(SignUpDto form);
    String makeDigest(String s);
}

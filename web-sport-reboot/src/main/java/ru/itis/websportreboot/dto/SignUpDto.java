package ru.itis.websportreboot.dto;

import lombok.Data;

@Data
public class SignUpDto {
    private String firstName;
    private String lastName;
    private String login;
    private String email;
    private String password;
    private String phoneNumber;
    private String photo;
    private String confirmCode;
    private String code;
}

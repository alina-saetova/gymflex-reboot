package ru.itis.websportreboot.dto;

import lombok.Data;

@Data
public class SignUpDto {
    private String firstName;
    private String lastName;
    private String login;
    private String password;
}

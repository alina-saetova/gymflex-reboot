package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    User getCurrentUser(HttpServletRequest request);
    void updateUser(String firstName, String lastName, String login, HttpServletRequest request);
    String changeUserPassword(String oldPassword, String newPassword, HttpServletRequest request);
}

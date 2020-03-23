package ru.itis.websportreboot.service;

import org.springframework.security.core.Authentication;
import ru.itis.websportreboot.models.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    void updateUser(String firstName, String lastName, String login, User user);
//    String changeUserPassword(String oldPassword, String newPassword, Authentication authentication);
}

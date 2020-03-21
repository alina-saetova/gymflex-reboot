package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.User;

import javax.servlet.http.HttpServletRequest;

public interface UserService {

    User getCurrentUser(HttpServletRequest request);
}

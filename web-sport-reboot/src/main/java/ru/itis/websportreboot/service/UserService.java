package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.User;

public interface UserService {

    void updateUser(String firstName, String lastName, String login, User user);
}

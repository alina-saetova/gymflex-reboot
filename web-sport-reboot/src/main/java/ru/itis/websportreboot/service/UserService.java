package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.ProfileForm;
import ru.itis.websportreboot.models.User;

public interface UserService {

    User updateUser(ProfileForm profileForm, User user);
}

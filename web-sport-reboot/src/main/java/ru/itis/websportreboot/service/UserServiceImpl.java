package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.ProfileForm;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.UsersRepository;
import ru.itis.websportreboot.security.UserDetailsImpl;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public User updateUser(ProfileForm profileForm, User user) {
        user.setFirstName(profileForm.getFirstName());
        user.setLastName(profileForm.getLastName());
        user.setLogin(profileForm.getLogin());
        user.setEmail(profileForm.getEmail());
        usersRepository.save(user);
        return user;
    }

}

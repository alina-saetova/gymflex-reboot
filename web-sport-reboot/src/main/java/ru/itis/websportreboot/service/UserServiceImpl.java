package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
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
    public void updateUser(String firstName, String lastName, String login, User user) {
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setLogin(login);
        usersRepository.save(user);
    }

//    @Override
//    public String changeUserPassword(String oldPassword, String newPassword, User user) {
//        String oldPasswordHash = UserUtils.makeDigest(oldPassword);
//        String newPasswordHash = UserUtils.makeDigest(newPassword);
//
//        if (!oldPasswordHash.equals(user.getPassword())) {
//            return "error";
//        }
//        else {
//            user.setPassword(newPasswordHash);
//        }
//        usersRepository.save(user);
//        return "ok";
//    }
}

package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.UsersRepository;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UsersRepository usersRepository;

    @Override
    public void signUp(SignUpDto form) {
        User user = User.builder()
                .firstName(form.getFirstName())
                .lastName(form.getLastName())
                .password(makeDigest(form.getPassword()))
                .login(form.getLogin())
                .build();
        usersRepository.save(user);
    }

    @Override
    public String makeDigest(String s) {
        MessageDigest messageDigest = null;
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        messageDigest.reset();
        messageDigest.update(s.getBytes());
        byte[] digest = messageDigest.digest();

        StringBuilder hexString = new StringBuilder();
        for (byte b : digest) {
            hexString.append(Integer.toHexString(0xFF & b));
        }
        return hexString.toString();
    }
}

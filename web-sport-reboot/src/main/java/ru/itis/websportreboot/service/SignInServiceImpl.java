package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.CookieValue;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.CookieValuesRepository;
import ru.itis.websportreboot.repositories.UsersRepository;

import java.util.UUID;

import static ru.itis.websportreboot.utils.UserUtils.makeDigest;

@Service
public class SignInServiceImpl implements SignInService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private CookieValuesRepository cookieValuesRepository;

    @Override
    public String signIn(String email, String password, String remember) {
        User user = usersRepository.findByEmail(email);

        String value = null;
        if (user != null && user.getPassword().equals(makeDigest(password))) {
            value = UUID.randomUUID().toString();
            CookieValue cookieValue = CookieValue.builder()
                    .value(value)
                    .user(user)
                    .build();
            cookieValuesRepository.save(cookieValue);
        }

        return value;
    }
}

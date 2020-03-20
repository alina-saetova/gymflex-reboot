package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.CookieValue;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.CookieValuesRepository;
import ru.itis.websportreboot.repositories.UsersRepository;

import java.util.UUID;

@Service
public class CookieServiceImpl implements CookieService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private CookieValuesRepository cookieValuesRepository;

    @Override
    public String saveAuthCookie(String login) {
        User user = usersRepository.findByLogin(login);
        String value = UUID.randomUUID().toString();
        CookieValue cookieValue = CookieValue.builder()
                    .value(value)
                    .user(user)
                    .build();
        cookieValuesRepository.save(cookieValue);

        return value;
    }
}

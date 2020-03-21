package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.CookieValue;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.CookieValuesRepository;
import ru.itis.websportreboot.repositories.UsersRepository;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private CookieValuesRepository cookieValuesRepository;

    @Override
    public User getCurrentUser(HttpServletRequest request) {
        User user = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("AuthCookie")) {
                    String c = cookie.getValue();
                    CookieValue cv = cookieValuesRepository.findByValue(c);
                    if (cv != null) {
                        user = cv.getUser();
                    }
                }
            }
        }
        return user;
    }
}

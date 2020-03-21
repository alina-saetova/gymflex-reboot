package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.service.CookieService;
import ru.itis.websportreboot.service.SignUpService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SignUpController {

    @Autowired
    private SignUpService signUpService;

    @Autowired
    private CookieService cookieService;

    @GetMapping("/signUp")
    public String getSignUpPage() {
        return "sign_up";
    }

    @PostMapping("/signUp")
    public String signUp(SignUpDto form, HttpServletResponse response) {
        signUpService.signUp(form);
        String cookieValue = cookieService.saveAuthCookie(form.getLogin());
        Cookie cookie = new Cookie("AuthCookie", cookieValue);
        response.addCookie(cookie);
        return "redirect:/signUp";
    }
}

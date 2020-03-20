package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.service.CookieService;
import ru.itis.websportreboot.service.SignUpService;

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
    public String signUp(SignUpDto form) {
        signUpService.signUp(form);
        cookieService.saveAuthCookie(form.getLogin());
        return "redirect:/signUp";
    }
}

package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.service.SignUpService;

@Controller
public class SignUpController {

    @Autowired
    private SignUpService signUpService;

    @GetMapping("/signUp")
    public String getSignUpPage(Authentication authentication) {
        if (authentication != null) {
            return "redirect:/profile";
        }
        return "sign_up";
    }

    @PostMapping("/signUp")
    public String signUp(SignUpDto form) {
        System.out.println(form.getPhoto() + "rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
        signUpService.signUp(form);
        return "redirect:/signIn";
    }
}

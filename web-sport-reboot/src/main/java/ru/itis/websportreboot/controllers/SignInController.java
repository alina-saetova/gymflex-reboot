package ru.itis.websportreboot.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SignInController {

    @GetMapping("/signIn")
    public String getSignIn(Authentication authentication,
                            @RequestParam(value = "error", required = false) String error,
                            Model model) {
        if (authentication != null) {
            return "redirect:/profile";
        }
        if (error != null) {
            model.addAttribute("error", error);
        }
        return "sign_in";
    }

}

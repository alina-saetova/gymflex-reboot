package ru.itis.websportreboot.controllers;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.security.UserDetailsImpl;

@Controller
public class ChatController {

    @GetMapping("/chat")
    public String getIndexPage(Model model, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        model.addAttribute("login", user.getLogin());
        return "chat";
    }

}

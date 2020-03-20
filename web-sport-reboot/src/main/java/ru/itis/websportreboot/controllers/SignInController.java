package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.service.SignInService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SignInController {

    @Autowired
    private SignInService signInService;

    @GetMapping("/signIn")
    public String getSignIn(Model model) {
        return "sign_in";
    }


    @ResponseBody
    @RequestMapping(path = "/signIn/auth", produces = "application/text; charset=UTF-8")
    public String signIn(@RequestParam("email") String email,
                         @RequestParam("password") String password,
                         @RequestParam("remember") String check,
                         HttpServletResponse response) {

        String cookieValue = signInService.signIn(email, password, check);
        if (cookieValue == null) {
            return "error";
        }
        else if (check.equals("check")) {
            Cookie cookie = new Cookie("AuthCookie", cookieValue);
            response.addCookie(cookie);
        }
        return "ok";
    }
}

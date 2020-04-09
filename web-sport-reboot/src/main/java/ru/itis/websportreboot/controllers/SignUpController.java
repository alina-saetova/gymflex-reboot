package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.models.SignInRequest;
import ru.itis.websportreboot.models.SignInResponse;
import ru.itis.websportreboot.service.SendCodeService;
import ru.itis.websportreboot.service.SignUpService;

import java.util.Random;

@Controller
public class SignUpController {

    @Autowired
    private SignUpService signUpService;

    @Autowired
    private SendCodeService sendCodeService;

    @GetMapping("/signUp")
    public String getSignUpPage(Authentication authentication) {
        if (authentication != null) {
            return "redirect:/profile";
        }
        return "sign_up";
    }

    @ResponseBody
    @RequestMapping(path = "/signUp", produces = "application/text; charset=UTF-8")
    public String signUp(SignUpDto form) {
        System.out.println(form.getCode() + form.getConfirmCode());
        if (form.getCode().equals(form.getConfirmCode())) {
            signUpService.signUp(form);
            return "ok";
        }
        else {
            return "error";
        }
    }

    @ResponseBody
    @RequestMapping(path = "/signUp/sendCode", produces = "application/text; charset=UTF-8")
    public String sendCode(@RequestParam("phone") String phone) {
        return sendCodeService.sendCode(phone);
    }
}

package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.security.UserDetailsImpl;
import ru.itis.websportreboot.service.UserFavExercisesService;
import ru.itis.websportreboot.service.UserFavTrainingsService;
import ru.itis.websportreboot.service.UserService;


@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserFavExercisesService userFavExercisesService;

    @Autowired
    private UserFavTrainingsService userFavTrainingsService;

    @GetMapping("/profile")
    public String getProfilePage(Model model, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        model.addAttribute("user", userDetails.getUser());
        model.addAttribute("saved_exercises", userFavExercisesService.getAll(userDetails.getUser()));
        model.addAttribute("saved_trainings", userFavTrainingsService.getAll(userDetails.getUser()));
        return "profile";
    }


    @ResponseBody
    @RequestMapping(path = "/profile/saveProfile", produces = "application/text; charset=UTF-8")
    public String saveProfile(@RequestParam("firstname") String firstName,
                         @RequestParam("lastname") String lastName,
                         @RequestParam("login") String login,
                         Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        userService.updateUser(firstName, lastName, login, userDetails.getUser());
        return "ok";
    }

    @ResponseBody
    @RequestMapping(path = "/profile/deleteArticle", produces = "application/text; charset=UTF-8")
    public String deleteArticle(@RequestParam("id") Long id,
                                 @RequestParam("type") String type,
                                 Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();

        if (type.equals("exercise")) {
            userFavExercisesService.delete(id, userDetails.getUser());
        }
        else {
            userFavTrainingsService.delete(id, userDetails.getUser());
        }

        return "ok";
    }
}

package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.models.ProfileForm;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.UserTrainingRepository;
import ru.itis.websportreboot.security.UserDetailsImpl;
import ru.itis.websportreboot.service.CreateTrainingService;
import ru.itis.websportreboot.service.UserFavExercisesService;
import ru.itis.websportreboot.service.UserFavTrainingsService;
import ru.itis.websportreboot.service.UserService;

import javax.validation.Valid;


@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserFavExercisesService userFavExercisesService;

    @Autowired
    private UserFavTrainingsService userFavTrainingsService;

    @Autowired
    private CreateTrainingService createTrainingService;

    @GetMapping("/profile")
    public String getProfilePage(Model model, Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        model.addAttribute("user", user);
        model.addAttribute("user_trainings", createTrainingService.getUsersTrainings(user));
        model.addAttribute("saved_exercises", userFavExercisesService.getAll(user));
        model.addAttribute("saved_trainings", userFavTrainingsService.getAll(user));
        model.addAttribute("profileForm", new ProfileForm());
        return "profile";
    }

    @PostMapping("/profile")
    public String saveProfile(Authentication authentication,
                              @Valid ProfileForm form,
                              BindingResult bindingResult,
                              Model model) {

        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        System.out.println(form.toString());
        System.out.println(bindingResult.hasErrors());
        if (!bindingResult.hasErrors()) {
            user = userService.updateUser(form, userDetails.getUser());
        }
        model.addAttribute("profileForm", form);
        model.addAttribute("user", user);
        model.addAttribute("user_trainings", createTrainingService.getUsersTrainings(user));
        model.addAttribute("saved_exercises", userFavExercisesService.getAll(user));
        model.addAttribute("saved_trainings", userFavTrainingsService.getAll(user));
        return "profile";
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
        else if (type.equals("training")){
            userFavTrainingsService.delete(id, userDetails.getUser());
        }
        else {
            createTrainingService.delete(id, userDetails.getUser());
        }

        return "ok";
    }
}

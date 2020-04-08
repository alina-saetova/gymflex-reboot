package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.websportreboot.service.ExerciseService;
import ru.itis.websportreboot.service.TrainingService;
import ru.itis.websportreboot.service.UserService;

@Controller
public class MainController {

    @Autowired
    private TrainingService trainingService;

    @Autowired
    private UserService userService;

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping("/")
    public String getAllTrainingsPage(Model model) {
        model.addAttribute("trainings", trainingService.getAll());
        model.addAttribute("exercises", exerciseService.getAll());
        return "main_page";
    }
}

package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.service.ExerciseService;

import java.util.List;

@Controller
public class ExercisesSectionController {

    @Autowired
    private ExerciseService exerciseService;

    @GetMapping("/exerciseSection")
    public String getSignUpPage(Model model) {
        model.addAttribute("allexercises", exerciseService.getAll());
        return "exercises_section";
    }

    @ResponseBody
    @RequestMapping(path = "/exerciseSection/search", produces = "application/json; charset=UTF-8")
    public List<Exercise> searchExercises(@RequestParam("muscle") String muscle) {
        return exerciseService.search(muscle);
    }
}

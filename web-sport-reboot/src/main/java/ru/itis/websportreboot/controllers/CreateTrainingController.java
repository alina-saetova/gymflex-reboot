package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.security.UserDetailsImpl;
import ru.itis.websportreboot.service.CreateTrainingService;

import java.util.Map;

@Controller
public class CreateTrainingController {

    @Autowired
    private CreateTrainingService createTrainingService;

    @GetMapping("/createTraining")
    public String getCreateTrainingPage(Model model,
                                        Authentication authentication) {
        User user = null;
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            user = userDetails.getUser();
        }
        boolean flag = false;
        if (user != null) {
            flag = true;
        }
        model.addAttribute("flag", flag);

        return "create_training_title";
    }

    @PostMapping("/createTraining")
    public String createTitle(
            @RequestParam("exercises_number") String exercisesNumber,
            @RequestParam("training_name") String trainingName,
            Authentication authentication,
            RedirectAttributes redirectAttributes
    ) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        User user = userDetails.getUser();
        Long trainingId = createTrainingService.createTraining(user, trainingName);
        redirectAttributes.addAttribute("name", trainingName);
        redirectAttributes.addAttribute("exNum", exercisesNumber);
        redirectAttributes.addAttribute("trId", trainingId);
        return "redirect:/createTraining/exercises";
    }

    @GetMapping("/createTraining/exercises")
    public String getCreateTrainingExercisesPage(
            @RequestParam("name") String trainingName,
            @RequestParam("exNum") String exercisesNumber,
            @RequestParam("trId") String trainingId,
            Model model

    ) {
        model.addAttribute("name", trainingName);
        model.addAttribute("ex_num", Integer.parseInt(exercisesNumber));
        model.addAttribute("tr_id", trainingId);
        return "create_training_exercises";
    }

    @PostMapping("/createTraining/exercises")
    public String createExercises(@RequestParam Map<String, String> params) {
        int i = Integer.parseInt(params.get("ex_num"));
        Long trainingId = Long.parseLong(params.get("tr_id"));
        for (int j = 1; j <= i; j++) {
            String ex_name = params.get("" + j + "name");
            String reps_num = params.get("" + j + "reps");
            createTrainingService.createTrainingExercises(trainingId, ex_name, reps_num);
        }
        return "redirect:/profile";
    }
}

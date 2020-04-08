package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.Training;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.security.UserDetailsImpl;
import ru.itis.websportreboot.service.*;

import java.util.List;

@Controller
public class TrainingController {

    @Autowired
    private TrainingService trainingService;

    @Autowired
    private CommentaryService commentaryService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserFavTrainingsService userFavTrainingsService;

    @Autowired
    private ExerciseTrainingItemsService exerciseTrainingItemsService;

    @GetMapping("/trainings")
    public String getAllTrainingsPage(Model model) {
        model.addAttribute("alltrainings", trainingService.getAll());
        return "trainings_section";
    }

    @GetMapping("/trainings/{training-id}")
    public String getConcreteExercisePage(@PathVariable("training-id") Long trainingId,
                                          Model model,
                                          Authentication authentication) {
        User user = null;
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            user = userDetails.getUser();
        }
        Training training = trainingService.getConcreteTraining(trainingId);
        String like = "disable";
        if (user != null) {
            if (userFavTrainingsService.check(user.getId(), trainingId) == null) {
                like = "able";
            }
        }

        List<Exercise> exercises = exerciseTrainingItemsService.getAllExercisesFromTraining(trainingId);

        model.addAttribute("exercises", exercises);
        model.addAttribute("training", training);
        model.addAttribute("comms", commentaryService.getAllCommentaries("training", trainingId));
        model.addAttribute("user", user);
        model.addAttribute("flag", like);

        return "training";
    }

    @ResponseBody
    @RequestMapping(path = "/trainings/search", produces = "application/json; charset=UTF-8")
    public List<Training> searchTrainings(
            @RequestParam("gender") String gender,
            @RequestParam("purpose") String purpose,
            @RequestParam("location") String location
    ) {
        return trainingService.search(gender, purpose, location);
    }

    @ResponseBody
    @RequestMapping(path = "/trainings/{training-id}/comment", produces = "application/json; charset=UTF-8")
    public ResponseEntity<Commentary> comment(@PathVariable("training-id") Long trainingId,
                                              @RequestParam("type") String type,
                                              @RequestParam("text") String text,
                                              Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        return ResponseEntity.ok().body(commentaryService.comment(trainingId, type, text, userDetails.getUser()));
    }

    @ResponseBody
    @RequestMapping(path = "/trainings/{training-id}/like", produces = "application/text; charset=UTF-8")
    public String like(@PathVariable("training-id") Long trainingId,
                       Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        return "" + userFavTrainingsService.like(trainingId, userDetails.getUser());
    }
}

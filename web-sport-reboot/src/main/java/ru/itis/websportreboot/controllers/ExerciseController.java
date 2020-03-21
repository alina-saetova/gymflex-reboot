package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.service.CommentaryService;
import ru.itis.websportreboot.service.ExerciseService;
import ru.itis.websportreboot.service.UserFavExercisesService;
import ru.itis.websportreboot.service.UserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ExerciseController {

    @Autowired
    private ExerciseService exerciseService;

    @Autowired
    private CommentaryService commentaryService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserFavExercisesService userFavExercisesService;

    @GetMapping("/exercises")
    public String getAllExercisesPage(Model model) {
        model.addAttribute("allexercises", exerciseService.getAll());
        return "exercises_section";
    }

    @GetMapping("/exercises/{exercise-id}")
    public String getConcreteExercisePage(@PathVariable("exercise-id") Long exerciseId,
                                          Model model,
                                          HttpServletRequest request) {

        Exercise exercise = exerciseService.getConcreteExercise(exerciseId);
        User user = userService.getCurrentUser(request);
        String like = "error";
        if (user != null) {
            if (userFavExercisesService.check(user.getId(), exerciseId) != null) {
                like = "ok";
            }
        }
        model.addAttribute("exercise", exercise);
        model.addAttribute("comms", commentaryService.getAllCommentaries("exercise", exerciseId));
        model.addAttribute("user", user);
        model.addAttribute("flag", like);

        return "exercise";
    }

    @ResponseBody
    @RequestMapping(path = "/exercises/search", produces = "application/json; charset=UTF-8")
    public List<Exercise> searchExercises(@RequestParam("muscle") String muscle) {
        return exerciseService.search(muscle);
    }

    @ResponseBody
    @RequestMapping(path = "/exercises/{exercise-id}/comment", produces = "application/json; charset=UTF-8")
    public Commentary comment(@PathVariable("exercise-id") Long exerciseId,
                              @RequestParam("type") String type,
                              @RequestParam("text") String text,
                              HttpServletRequest request) {
        return commentaryService.comment(exerciseId, type, text, request);
    }

    @ResponseBody
    @RequestMapping(path = "/exercises/{exercise-id}/like", produces = "application/text; charset=UTF-8")
    public String like(@PathVariable("exercise-id") Long exerciseId,
                              HttpServletRequest request) {
        return "" + userFavExercisesService.like(exerciseId, request);
    }
}

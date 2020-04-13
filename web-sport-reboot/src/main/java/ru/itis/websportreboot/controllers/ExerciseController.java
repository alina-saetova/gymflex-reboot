package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.dto.ExercisesSearchResult;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.security.UserDetailsImpl;
import ru.itis.websportreboot.service.CommentaryService;
import ru.itis.websportreboot.service.ExerciseService;
import ru.itis.websportreboot.service.UserFavExercisesService;
import ru.itis.websportreboot.service.UserService;

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
                                          Authentication authentication) {
        User user = null;
        if (authentication != null) {
            UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
            user = userDetails.getUser();
        }
        Exercise exercise = exerciseService.getConcreteExercise(exerciseId);
        String like = "disable";
        if (user != null) {
            if (userFavExercisesService.check(user.getId(), exerciseId) == null) {
                like = "able";
            }
        }
        model.addAttribute("exercise", exercise);
        model.addAttribute("comms", commentaryService.getAllCommentaries("exercise", exerciseId));
        model.addAttribute("user", user);
        model.addAttribute("flag", like);

        return "exercise";
    }

    @ResponseBody
    @RequestMapping(path = "/exercises/{exercise-id}/comment", produces = "application/json; charset=UTF-8")
    public ResponseEntity<Commentary> comment(@PathVariable("exercise-id") Long exerciseId,
                              @RequestParam("type") String type,
                              @RequestParam("text") String text,
                              Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        return ResponseEntity.ok().body(commentaryService.comment(exerciseId, type, text, userDetails.getUser()));
    }

    @ResponseBody
    @RequestMapping(path = "/exercises/{exercise-id}/like", produces = "application/text; charset=UTF-8")
    public String like(@PathVariable("exercise-id") Long exerciseId,
                              Authentication authentication) {
        UserDetailsImpl userDetails = (UserDetailsImpl) authentication.getPrincipal();
        return "" + userFavExercisesService.like(exerciseId, userDetails.getUser());
    }
}

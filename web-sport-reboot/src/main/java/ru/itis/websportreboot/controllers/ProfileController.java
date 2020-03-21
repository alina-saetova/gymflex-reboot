package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.service.UserFavExercisesService;
import ru.itis.websportreboot.service.UserService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ProfileController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserFavExercisesService userFavExercisesService;

    @GetMapping("/profile")
    public String getProfilePage(Model model, HttpServletRequest request) {
        User user = userService.getCurrentUser(request);
        if (user == null) {
            return "redirect:/signIn";
        }

        model.addAttribute("user", user);
        model.addAttribute("saved_exercises", userFavExercisesService.getAll(request));
        return "profile";
    }


    @ResponseBody
    @RequestMapping(path = "/profile/saveProfile", produces = "application/text; charset=UTF-8")
    public String saveProfile(@RequestParam("firstname") String firstName,
                         @RequestParam("lastname") String lastName,
                         @RequestParam("login") String login,
                         HttpServletRequest request) {
        userService.updateUser(firstName, lastName, login, request);
        return "ok";
    }

    @ResponseBody
    @RequestMapping(path = "/profile/changePassword", produces = "application/text; charset=UTF-8")
    public String changePassword(@RequestParam("oldpassword") String oldPassword,
                         @RequestParam("newpassword") String newPassword,
                         HttpServletRequest request) {
        return userService.changeUserPassword(oldPassword, newPassword, request);
    }

    @ResponseBody
    @RequestMapping(path = "/profile/deleteArticle", produces = "application/text; charset=UTF-8")
    public String deleteArticle(@RequestParam("id") Long id,
                                 @RequestParam("type") String type,
                                 HttpServletRequest request) {
        userFavExercisesService.delete(id, request);
        return "ok";
    }
}

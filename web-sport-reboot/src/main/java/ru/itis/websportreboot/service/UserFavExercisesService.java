package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.UserToExercise;

import javax.servlet.http.HttpServletRequest;

public interface UserFavExercisesService {

    UserToExercise check(Long userId, Long exerciseId);
    int like(Long userId, HttpServletRequest request);
}

package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.UserToExercise;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserFavExercisesService {

    UserToExercise check(Long userId, Long exerciseId);
    int like(Long userId, HttpServletRequest request);
    List<Exercise> getAll(HttpServletRequest request);
    void delete(Long exerciseId, HttpServletRequest request);
}

package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserToExercise;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserFavExercisesService {

    UserToExercise check(Long userId, Long exerciseId);
    int like(Long exerciseId, User user);
    List<Exercise> getAll(User user);
    void delete(Long exerciseId, User user);
}

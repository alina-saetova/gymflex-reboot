package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Training;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserToTraining;

import java.util.List;

public interface UserFavTrainingsService {

    UserToTraining check(Long userId, Long trainingId);
    int like(Long trainingId, User user);
    List<Training> getAll(User user);
    void delete(Long trainingId, User user);
}

package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserTraining;

import java.util.List;

public interface CreateTrainingService {

    Long createTraining(User user, String trainingName);
    void createTrainingExercises(Long trainingId, String exerciseName, String repsNumber);
    List<UserTraining> getUsersTrainings(User user);
    void delete(Long id, User user);
}

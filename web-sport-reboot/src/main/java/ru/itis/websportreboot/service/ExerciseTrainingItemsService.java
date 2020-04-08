package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Exercise;

import java.util.List;

public interface ExerciseTrainingItemsService {

    List<Exercise> getAllExercisesFromTraining(Long trainingId);
}

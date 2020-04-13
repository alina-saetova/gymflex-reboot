package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Exercise;

import java.util.List;

public interface ExerciseService {

    List<Exercise> getAll();
    Exercise getConcreteExercise(Long id);
}

package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.ExerciseTrainingItem;
import ru.itis.websportreboot.repositories.ExerciseTrainingItemRepository;
import ru.itis.websportreboot.repositories.ExercisesRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class ExerciseTrainingItemsServiceImpl implements ExerciseTrainingItemsService {

    @Autowired
    private ExerciseTrainingItemRepository exerciseTrainingItemRepository;

    @Autowired
    private ExercisesRepository exercisesRepository;

    @Autowired
    private ExerciseService exerciseService;

    @Override
    public List<Exercise> getAllExercisesFromTraining(Long trainingId) {
        List<ExerciseTrainingItem> list = exerciseTrainingItemRepository.findAllByTrainingId(trainingId);
        List<Exercise> exercises = new ArrayList<>();
        for (ExerciseTrainingItem eti: list) {
            exercises.add(exerciseService.getConcreteExercise(eti.getExerciseId()));
        }
        return exercises;
    }
}

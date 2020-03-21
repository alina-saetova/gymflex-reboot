package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.repositories.ExercisesRepository;

import java.util.List;
import java.util.Optional;

@Service
public class ExerciseServiceImpl implements ExerciseService{

    @Autowired
    private ExercisesRepository exercisesRepository;

    @Override
    public List<Exercise> getAll() {
        return exercisesRepository.findAll();
    }

    @Override
    public List<Exercise> search(String type) {
        return exercisesRepository.findByType(type);
    }

    @Override
    public Exercise getConcreteExercise(Long id) {
        Optional<Exercise> exerciseOptional = exercisesRepository.findById(id);
        return exerciseOptional.orElse(null);
    }
}

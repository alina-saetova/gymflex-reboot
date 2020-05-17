package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.FavUserExercise;
import ru.itis.websportreboot.repositories.ExercisesRepository;
import ru.itis.websportreboot.repositories.UserFavExerciseRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserFavExercisesServiceImpl implements UserFavExercisesService {

    @Autowired
    private UserFavExerciseRepository userFavExerciseRepository;

    @Autowired
    private ExercisesRepository exercisesRepository;

    @Autowired
    private ExerciseService exerciseService;

    @Override
    public FavUserExercise check(Long userId, Long exerciseId) {
        Optional<FavUserExercise> optional = userFavExerciseRepository.findByExerciseIdAndUserId(exerciseId, userId);
        return optional.orElse(null);
    }

    @Override
    public int like(Long exerciseId, User user) {
        userFavExerciseRepository.save(
                FavUserExercise.builder()
                .exerciseId(exerciseId)
                .userId(user.getId())
                .build()
        );
        Optional<Exercise> optionalExercise = exercisesRepository.findById(exerciseId);
        int count = 0;
        if (optionalExercise.isPresent()) {
            Exercise exercise = optionalExercise.get();
            count = exercise.getCnt_likes() + 1;
            exercise.setCnt_likes(count);
            exercisesRepository.save(exercise);
        }
        return count;
    }

    @Override
    public List<Exercise> getAll(User user) {
        List<FavUserExercise> list = userFavExerciseRepository.findAllByUserId(user.getId());
        List<Exercise> exercises = new ArrayList<>();
        for (FavUserExercise ute: list) {
            exercises.add(exerciseService.getConcreteExercise(ute.getExerciseId()));
        }
        return exercises;
    }

    @Override
    public void delete(Long exerciseId, User user) {
        FavUserExercise u = userFavExerciseRepository.findByExerciseIdAndUserId(exerciseId, user.getId()).get();
        userFavExerciseRepository.deleteById(u.getId());

        Exercise exercise = exerciseService.getConcreteExercise(exerciseId);
        exercise.setCnt_likes(exercise.getCnt_likes() - 1);
        exercisesRepository.save(exercise);
    }
}

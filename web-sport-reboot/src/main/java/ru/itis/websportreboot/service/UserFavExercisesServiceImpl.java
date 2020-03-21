package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserToExercise;
import ru.itis.websportreboot.repositories.ExercisesRepository;
import ru.itis.websportreboot.repositories.UserToExerciseRepository;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserFavExercisesServiceImpl implements UserFavExercisesService {

    @Autowired
    private UserToExerciseRepository userToExerciseRepository;

    @Autowired
    private ExercisesRepository exercisesRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private ExerciseService exerciseService;

    @Override
    public UserToExercise check(Long userId, Long exerciseId) {
        Optional<UserToExercise> optional = userToExerciseRepository.findByExerciseIdAndUserId(exerciseId, userId);
        return optional.orElse(null);
    }

    @Override
    public int like(Long exerciseId, HttpServletRequest request) {
        User user = userService.getCurrentUser(request);
        userToExerciseRepository.save(UserToExercise.builder().exerciseId(exerciseId).userId(user.getId()).build());
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
    public List<Exercise> getAll(HttpServletRequest request) {
        User user = userService.getCurrentUser(request);
        List<UserToExercise> list = userToExerciseRepository.findAllByUserId(user.getId());
        List<Exercise> exercises = new ArrayList<>();
        for (UserToExercise ute: list) {
            exercises.add(exerciseService.getConcreteExercise(ute.getExerciseId()));
        }
        return exercises;
    }

    @Override
    public void delete(Long exerciseId, HttpServletRequest request) {
        User user = userService.getCurrentUser(request);
        UserToExercise u = userToExerciseRepository.findByExerciseIdAndUserId(exerciseId, user.getId()).get();
        userToExerciseRepository.deleteById(u.getId());

        Exercise exercise = exerciseService.getConcreteExercise(exerciseId);
        exercise.setCnt_likes(exercise.getCnt_likes() - 1);
        exercisesRepository.save(exercise);
    }
}

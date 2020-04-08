package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserExercise;
import ru.itis.websportreboot.models.UserTraining;
import ru.itis.websportreboot.repositories.UserExerciseRepository;
import ru.itis.websportreboot.repositories.UserTrainingRepository;

import java.util.List;

@Service
public class CreateTrainingServiceImpl implements CreateTrainingService {

    @Autowired
    private UserTrainingRepository userTrainingRepository;

    @Autowired
    private UserExerciseRepository userExerciseRepository;

    @Override
    public Long createTraining(User user, String trainingName) {
        UserTraining userTraining = UserTraining.builder()
                .name(trainingName)
                .user(user)
                .build();
        UserTraining u = userTrainingRepository.save(userTraining);
        return u.getId();
    }

    @Override
    public void createTrainingExercises(Long trainingId, String exerciseName, String repsNumber) {
        UserTraining userTraining = userTrainingRepository.getOne(trainingId);
        UserExercise userExercise = UserExercise.builder()
                .userTraining(userTraining)
                .name(exerciseName)
                .reps(repsNumber)
                .build();
        userTraining.getExercises().add(userExercise);
        userTrainingRepository.save(userTraining);
//        userExerciseRepository.save(userExercise);
    }

    @Override
    public List<UserTraining> getUsersTrainings(User user) {
        return userTrainingRepository.findAllByUser(user);
    }

    @Override
    public void delete(Long id, User user) {
        userTrainingRepository.deleteById(id);
    }


}

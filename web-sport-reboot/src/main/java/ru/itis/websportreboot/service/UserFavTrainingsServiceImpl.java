package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Training;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserToTraining;
import ru.itis.websportreboot.repositories.TrainingsRepository;
import ru.itis.websportreboot.repositories.UserToTrainingRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserFavTrainingsServiceImpl implements UserFavTrainingsService {

    @Autowired
    private UserToTrainingRepository userToTrainingRepository;

    @Autowired
    private TrainingsRepository trainingsRepository;

    @Autowired
    private TrainingService trainingService;

    @Override
    public UserToTraining check(Long userId, Long trainingId) {
        Optional<UserToTraining> optional = userToTrainingRepository.findByTrainingIdAndUserId(trainingId, userId);
        return optional.orElse(null);
    }

    @Override
    public int like(Long trainingId, User user) {
        userToTrainingRepository.save(UserToTraining.builder().trainingId(trainingId).userId(user.getId()).build());
        Optional<Training> optionalExercise = trainingsRepository.findById(trainingId);
        int count = 0;
        if (optionalExercise.isPresent()) {
            Training training = optionalExercise.get();
            count = training.getCnt_likes() + 1;
            training.setCnt_likes(count);
            trainingsRepository.save(training);
        }
        return count;
    }

    @Override
    public List<Training> getAll(User user) {
        List<UserToTraining> list = userToTrainingRepository.findAllByUserId(user.getId());
        List<Training> exercises = new ArrayList<>();
        for (UserToTraining ute: list) {
            exercises.add(trainingService.getConcreteTraining(ute.getTrainingId()));
        }
        return exercises;
    }

    @Override
    public void delete(Long trainingId, User user) {
        UserToTraining u = userToTrainingRepository.findByTrainingIdAndUserId(trainingId, user.getId()).get();
        userToTrainingRepository.deleteById(u.getId());

        Training training = trainingService.getConcreteTraining(trainingId);
        training.setCnt_likes(training.getCnt_likes() - 1);
        trainingsRepository.save(training);
    }
}

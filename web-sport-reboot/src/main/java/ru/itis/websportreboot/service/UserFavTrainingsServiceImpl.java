package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Training;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.FavUserTraining;
import ru.itis.websportreboot.repositories.TrainingsRepository;
import ru.itis.websportreboot.repositories.UserFavTrainingRepository;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserFavTrainingsServiceImpl implements UserFavTrainingsService {

    @Autowired
    private UserFavTrainingRepository userFavTrainingRepository;

    @Autowired
    private TrainingsRepository trainingsRepository;

    @Autowired
    private TrainingService trainingService;

    @Override
    public FavUserTraining check(Long userId, Long trainingId) {
        Optional<FavUserTraining> optional = userFavTrainingRepository.findByTrainingIdAndUserId(trainingId, userId);
        return optional.orElse(null);
    }

    @Override
    public int like(Long trainingId, User user) {
        userFavTrainingRepository.save(FavUserTraining.builder().trainingId(trainingId).userId(user.getId()).build());
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
        List<FavUserTraining> list = userFavTrainingRepository.findAllByUserId(user.getId());
        List<Training> exercises = new ArrayList<>();
        for (FavUserTraining ute: list) {
            exercises.add(trainingService.getConcreteTraining(ute.getTrainingId()));
        }
        return exercises;
    }

    @Override
    public void delete(Long trainingId, User user) {
        FavUserTraining u = userFavTrainingRepository.findByTrainingIdAndUserId(trainingId, user.getId()).get();
        userFavTrainingRepository.deleteById(u.getId());

        Training training = trainingService.getConcreteTraining(trainingId);
        training.setCnt_likes(training.getCnt_likes() - 1);
        trainingsRepository.save(training);
    }
}

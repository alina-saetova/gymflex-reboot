package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Training;
import ru.itis.websportreboot.repositories.TrainingsRepository;

import java.util.List;
import java.util.Optional;

@Service
public class TrainingServiceImpl implements TrainingService {

    @Autowired
    private TrainingsRepository trainingsRepository;

    @Override
    public List<Training> getAll() {
        return trainingsRepository.findAll();
    }

    @Override
    public List<Training> search(String gender, String purpose, String location) {
        return trainingsRepository.findByGenderAndPurposeAndLocation(gender, purpose, location);
    }

    @Override
    public Training getConcreteTraining(Long id) {
        Optional<Training> trainingOptional = trainingsRepository.findById(id);
        return trainingOptional.orElse(null);
    }
}

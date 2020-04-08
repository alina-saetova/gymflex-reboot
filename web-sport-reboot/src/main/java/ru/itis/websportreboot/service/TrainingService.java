package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Training;

import java.util.List;

public interface TrainingService {
    List<Training> getAll();
    List<Training> search(String gender, String purpose, String location);
    Training getConcreteTraining(Long id);

}

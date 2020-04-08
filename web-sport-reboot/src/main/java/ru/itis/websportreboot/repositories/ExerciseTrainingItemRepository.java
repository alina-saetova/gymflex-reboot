package ru.itis.websportreboot.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.ExerciseTrainingItem;

import java.util.List;

public interface ExerciseTrainingItemRepository extends JpaRepository<ExerciseTrainingItem, Long> {

    List<ExerciseTrainingItem> findAllByTrainingId(Long trainingId);
}

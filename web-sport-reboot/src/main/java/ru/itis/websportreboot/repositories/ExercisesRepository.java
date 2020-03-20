package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.Exercise;

import java.util.List;

public interface ExercisesRepository extends JpaRepository<Exercise, Long> {

    List<Exercise> findAll();
    List<Exercise> findByType(String type);
}

package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.Exercise;

import java.util.List;
import java.util.Optional;

public interface ExercisesRepository extends JpaRepository<Exercise, Long> {

    List<Exercise> findAll();
    List<Exercise> findByType(String type);
    Optional<Exercise> findById(Long id);
}

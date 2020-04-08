package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.UserExercise;

import java.util.List;

public interface UserExerciseRepository extends JpaRepository<UserExercise, Long> {

    List<UserExercise> findAll();
}

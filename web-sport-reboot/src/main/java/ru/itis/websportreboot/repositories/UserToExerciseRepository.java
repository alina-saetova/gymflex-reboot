package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.UserToExercise;

import java.util.Optional;

public interface UserToExerciseRepository extends JpaRepository<UserToExercise, Long> {

    Optional<UserToExercise> findByExerciseIdAndUserId(Long exerciseId, Long userId);
}

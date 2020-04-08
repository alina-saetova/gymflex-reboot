package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.FavUserExercise;

import java.util.List;
import java.util.Optional;

public interface UserFavExerciseRepository extends JpaRepository<FavUserExercise, Long> {

    Optional<FavUserExercise> findByExerciseIdAndUserId(Long exerciseId, Long userId);
    List<FavUserExercise> findAllByUserId(Long userId);
}

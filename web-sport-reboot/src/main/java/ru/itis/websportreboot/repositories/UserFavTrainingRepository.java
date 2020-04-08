package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.FavUserTraining;

import java.util.List;
import java.util.Optional;

public interface UserFavTrainingRepository extends JpaRepository<FavUserTraining, Long> {

    Optional<FavUserTraining> findByTrainingIdAndUserId(Long trainingId, Long userId);
    List<FavUserTraining> findAllByUserId(Long userId);
}

package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.UserToTraining;

import java.util.List;
import java.util.Optional;

public interface UserToTrainingRepository extends JpaRepository<UserToTraining, Long> {

    Optional<UserToTraining> findByTrainingIdAndUserId(Long trainingId, Long userId);
    List<UserToTraining> findAllByUserId(Long userId);
}

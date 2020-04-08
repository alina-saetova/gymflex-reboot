package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.models.UserTraining;

import java.util.List;

public interface UserTrainingRepository extends JpaRepository<UserTraining, Long> {

    List<UserTraining> findAllByUser(User user);
}

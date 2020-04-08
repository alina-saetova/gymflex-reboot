package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.Training;

import java.util.List;
import java.util.Optional;

public interface TrainingsRepository extends JpaRepository<Training, Long> {

    List<Training> findAll();
    List<Training> findByGenderAndPurposeAndLocation(String gender, String purpose, String location);
    Optional<Training> findById(Long id);
}

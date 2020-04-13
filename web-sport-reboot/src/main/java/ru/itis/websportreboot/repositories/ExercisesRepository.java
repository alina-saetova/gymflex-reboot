package ru.itis.websportreboot.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import ru.itis.websportreboot.models.Exercise;

import java.util.List;
import java.util.Optional;

public interface ExercisesRepository extends JpaRepository<Exercise, Long> {

    List<Exercise> findAll();
    List<Exercise> findByType(String type);
    Optional<Exercise> findById(Long id);

    @Query("from Exercise exercise where " +
            "upper(exercise.name) like concat('%', upper(:query), '%') or " +
            "upper(exercise.type) like concat('%', upper(:query), '%')")
    Page<Exercise> search(@Param("query") String query, Pageable pageable);
}

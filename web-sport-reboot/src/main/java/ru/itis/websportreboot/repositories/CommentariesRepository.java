package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.Commentary;

import java.util.List;

public interface CommentariesRepository extends JpaRepository<Commentary, Long> {

    List<Commentary> findAllByArticleIdAndType(Long articleId, String type);
}

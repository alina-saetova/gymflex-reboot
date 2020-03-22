package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface CommentaryService {

    List<Commentary> getAllCommentaries(String type, Long article_id);
    Commentary comment(Long id, String type, String text, User user);
}

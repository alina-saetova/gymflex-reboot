package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.CommentariesRepository;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class CommentaryServiceImpl implements CommentaryService {

    @Autowired
    private CommentariesRepository commentariesRepository;

    @Override
    public List<Commentary> getCommentariesByArticleId(String type, Long article_id) {
        return commentariesRepository.findAllByArticleIdAndType(article_id, type);
    }

    @Override
    public List<Commentary> getAllCommentaries() {
        return commentariesRepository.findAll();
    }

    @Override
    public Commentary comment(Long id, String type, String text, User user) {
        Commentary com = Commentary.builder()
                .articleId(id)
                .content(text)
                .type(type)
                .user(user)
                .build();
        commentariesRepository.save(com);
        com.getUser().setCommentaries(new ArrayList<>());
        return com;
    }
}

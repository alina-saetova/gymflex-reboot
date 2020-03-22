package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.CommentariesRepository;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class CommentaryServiceImpl implements CommentaryService {

    @Autowired
    private CommentariesRepository commentariesRepository;

    @Override
    public List<Commentary> getAllCommentaries(String type, Long article_id) {
        return commentariesRepository.findAllByArticleIdAndType(article_id, type);
    }

    @Override
    public Commentary comment(Long id, String type, String text, User user) {
        Date date = new Date();
        SimpleDateFormat f = new SimpleDateFormat("dd.MM.yyyy hh:mm");
        String stringDate = f.format(date);
        Commentary com = Commentary.builder()
                .articleId(id)
                .content(text)
                .stringDate(stringDate)
                .type(type)
                .user(user)
                .build();
        commentariesRepository.save(com);
        return com;
    }
}

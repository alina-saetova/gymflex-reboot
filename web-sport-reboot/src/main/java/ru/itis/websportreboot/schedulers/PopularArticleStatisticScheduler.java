package ru.itis.websportreboot.schedulers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.service.CommentaryService;
import ru.itis.websportreboot.service.StatisticService;

import java.util.List;

@Configuration
@EnableScheduling
public class PopularArticleStatisticScheduler {

    @Autowired
    private CommentaryService commentaryService;

    @Autowired
    private StatisticService statisticService;

    @Transactional
    @Scheduled(cron = "0 0 3 1 * ?")
    public void run() {
        List<Commentary> commentaries = commentaryService.getAllCommentaries();
        statisticService.createStatistic(commentaries);
    }
}

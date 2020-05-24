package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.models.Commentary;
import ru.itis.websportreboot.models.Statistic;
import ru.itis.websportreboot.repositories.StatisticRepository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class StatisticServiceImpl implements StatisticService {

    @Autowired
    private StatisticRepository statisticRepository;

    @Override
    public void createStatistic(List<Commentary> commentaries) {
        Map<Long, Integer> frequency = new HashMap<>();
        for (Commentary com : commentaries) {
            if (frequency.containsKey(com.getArticleId())) {
                int count = frequency.get(com.getArticleId()) + 1;
                frequency.put(com.getArticleId(), count);
            } else {
                frequency.put(com.getArticleId(), 0);
            }
        }
        Long mostPopularId = 0L;
        for (Long id : frequency.keySet()) {
            if (frequency.get(id) > frequency.get(mostPopularId)) {
                mostPopularId = id;
            }
        }
        statisticRepository.save(Statistic.builder().articleId(mostPopularId).build());
    }
}

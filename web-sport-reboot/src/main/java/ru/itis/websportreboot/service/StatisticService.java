package ru.itis.websportreboot.service;

import ru.itis.websportreboot.models.Commentary;

import java.util.List;

public interface StatisticService {

    void createStatistic(List<Commentary> commentaries);
}

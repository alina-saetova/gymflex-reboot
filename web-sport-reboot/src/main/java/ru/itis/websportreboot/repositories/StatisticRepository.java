package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.Statistic;

public interface StatisticRepository  extends JpaRepository<Statistic, Long> {

}

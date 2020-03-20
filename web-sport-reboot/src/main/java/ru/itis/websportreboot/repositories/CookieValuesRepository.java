package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.CookieValue;

public interface CookieValuesRepository extends JpaRepository<CookieValue, Long> {
    CookieValue findByValue(String value);
}

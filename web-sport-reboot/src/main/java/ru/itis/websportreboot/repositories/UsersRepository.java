package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.User;

public interface UsersRepository extends JpaRepository<User, Long> {
    User findByLogin(String login);
}

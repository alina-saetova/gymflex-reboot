package ru.itis.websportreboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.websportreboot.models.User;

import java.util.Optional;

public interface UsersRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);
    Optional<User> findByConfirmCode(String confirmCode);
}

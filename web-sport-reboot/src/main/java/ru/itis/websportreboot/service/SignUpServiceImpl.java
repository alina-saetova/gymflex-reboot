package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.models.Role;
import ru.itis.websportreboot.models.State;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.UsersRepository;

import java.util.UUID;
import java.util.concurrent.ExecutorService;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private EmailService emailService;

    @Autowired
    private ExecutorService threadPool;

    @Autowired
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public void signUp(SignUpDto form) {
        User user = User.builder()
                .firstName(form.getFirstName())
                .lastName(form.getLastName())
                .password(passwordEncoder.encode(form.getPassword()))
                .login(form.getLogin())
                .email(form.getEmail())
                .photo(form.getPhoto())
                .state(State.NOT_CONFIRMED)
                .role(Role.USER)
                .confirmCode(UUID.randomUUID().toString())
                .build();
        usersRepository.save(user);
        threadPool.submit(() -> emailService.sendEmail("Confirm", user.getConfirmCode(), user.getEmail()));
    }

}

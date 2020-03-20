package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.dto.SignUpDto;
import ru.itis.websportreboot.models.State;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.UsersRepository;

import java.util.UUID;

import static ru.itis.websportreboot.utils.UserUtils.makeDigest;

@Service
public class SignUpServiceImpl implements SignUpService {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private EmailService emailService;

    @Override
    public void signUp(SignUpDto form) {
        User user = User.builder()
                .firstName(form.getFirstName())
                .lastName(form.getLastName())
                .password(makeDigest(form.getPassword()))
                .login(form.getLogin())
                .email(form.getEmail())
                .state(State.NOT_CONFIRMED)
                .confirmCode(UUID.randomUUID().toString())
                .build();
        usersRepository.save(user);
        emailService.sendEmail("Confirm", user.getConfirmCode(), user.getEmail());
    }

}

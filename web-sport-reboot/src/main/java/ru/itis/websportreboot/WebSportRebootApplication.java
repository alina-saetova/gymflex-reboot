package ru.itis.websportreboot;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import ru.itis.websportreboot.models.Role;
import ru.itis.websportreboot.models.State;
import ru.itis.websportreboot.models.User;
import ru.itis.websportreboot.repositories.UsersRepository;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

@SpringBootApplication
public class WebSportRebootApplication {

    @Bean
    public ExecutorService executorService() {
        return Executors.newFixedThreadPool(20);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public ObjectMapper objectMapper() {
        return new ObjectMapper();
    }

    // я не знаю что это, но без этого не работает..
    // Bean named 'defaultSockJsTaskScheduler' is expected to be of type 'org.springframework.scheduling.TaskScheduler'
    // but was actually of type 'org.springframework.beans.factory.support.NullBean'
    @Bean
    public TaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler taskScheduler = new ThreadPoolTaskScheduler();
        taskScheduler.setPoolSize(3);
        taskScheduler.setThreadNamePrefix("task");
        taskScheduler.setDaemon(true);
        return taskScheduler;
    }

    public static void main(String[] args) {
        SpringApplication.run(WebSportRebootApplication.class, args);
    }

}

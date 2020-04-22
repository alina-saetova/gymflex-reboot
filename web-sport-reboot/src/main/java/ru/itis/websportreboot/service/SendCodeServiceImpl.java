package ru.itis.websportreboot.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import ru.itis.websportreboot.models.SignInRequest;
import ru.itis.websportreboot.models.SignInResponse;

import java.util.Random;

@Service
public class SendCodeServiceImpl implements SendCodeService {

    @Override
    public String sendCode(String phone) {

        Random random = new Random();
        int number = random.nextInt(1000) + 1000;
        String message = "your confirm code is " + number;
        System.out.println(number);

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setBasicAuth("alinasaetowa@gmail.com", "27EI3y5yK8fh39Hv6b4iQWd4SAO9");

        HttpEntity<SignInRequest> request = new HttpEntity<>(
                new SignInRequest(phone, message, "SMS Aero", "DIRECT"), httpHeaders);
        String resourceUrl = "https://gate.smsaero.ru/v2/sms/send";

        restTemplate.postForEntity(resourceUrl, request, SignInResponse.class);

        return "" + number;
    }
}

package ru.itis.websportreboot.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
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

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.setBasicAuth("alinka270200@gmail.com", "IISyIAVPAMbh7cB44IMfPXzRheML");

        HttpEntity<SignInRequest> request = new HttpEntity<>(
                new SignInRequest(phone, message, "SMS Aero", "DIRECT"), httpHeaders);
        String resourceUrl = "https://gate.smsaero.ru/v2/sms/send";

        ResponseEntity<SignInResponse> response = restTemplate.postForEntity(resourceUrl, request, SignInResponse.class);

        return "" + number;
    }
}

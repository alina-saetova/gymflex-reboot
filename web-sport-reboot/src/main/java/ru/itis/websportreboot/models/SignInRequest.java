package ru.itis.websportreboot.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SignInRequest {

    private String number;
    private String text;
    private String sign;
    private String channel;
}

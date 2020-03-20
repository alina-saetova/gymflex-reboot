package ru.itis.websportreboot.service;

public interface CalculatorService {

    Long calculate(String gender, String formula,
                   String weight, String height,
                   String age, String activity);
}

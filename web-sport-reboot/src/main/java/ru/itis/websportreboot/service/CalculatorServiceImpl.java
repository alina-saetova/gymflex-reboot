package ru.itis.websportreboot.service;

import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.util.Map;
import java.util.TreeMap;

@Service
public class CalculatorServiceImpl implements CalculatorService {

    private TreeMap<String, Double> act;

    @PostConstruct
    public void init() {
        act = new TreeMap<>();
        act.put("none", 1.2);
        act.put("small", 1.375);
        act.put("medium", 1.55);
        act.put("big", 1.725);
        act.put("huge", 1.9);
    }

    @Override
    public Long calculate(String gender, String formula,
                          String weight, String height,
                          String age, String activity) {
        long result;
        if (gender.equals("female")) {
            if (formula.equals("harris")) {
                result = Math.round((447.593 + 9.247 * Double.parseDouble(weight)
                        + 3.098 * Integer.parseInt(height)
                        - 4.33 * Integer.parseInt(age))
                        * act.get(activity));
            } else {
                result = Math.round((10 * Double.parseDouble(weight)
                        + 6.25 * Integer.parseInt(height)
                        - 5 * Integer.parseInt(age)
                        - 161)
                        * act.get(activity));
            }
        } else {
            if (formula.equals("harris")) {
                result = Math.round((float) (88.362 + 13.397 * Double.parseDouble(weight)
                        + 4.799 * Integer.parseInt(height)
                        - 5.677 * Integer.parseInt(age))
                        * act.get(activity));
            } else {
                result = Math.round((10 * Double.parseDouble(weight)
                        + 6.25 * Integer.parseInt(height)
                        - 5 * Integer.parseInt(age)
                        + 5)
                        * act.get(activity));
            }
        }
        return result;
    }
}

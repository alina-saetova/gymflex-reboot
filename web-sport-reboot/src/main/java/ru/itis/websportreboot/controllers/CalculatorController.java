package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ru.itis.websportreboot.service.CalculatorService;

@Controller
public class CalculatorController {

    @Autowired
    private CalculatorService calculatorService;

    @GetMapping("/calculator")
    public String getCalculatorPage() {
        return "calculator";
    }

    @ResponseBody
    @RequestMapping(path = "/calculator/calculate", produces = "application/text; charset=UTF-8")
    public String calculate(@RequestParam("age") String age,
                          @RequestParam("gender") String gender,
                          @RequestParam("weight") String weight,
                          @RequestParam("height") String height,
                          @RequestParam("activity") String activity,
                          @RequestParam("formula") String formula) {
        long result = calculatorService.calculate(gender, formula, weight, height, age, activity);
        //если лонг возвращать, то чета не получается
        return "" + result;
    }
}

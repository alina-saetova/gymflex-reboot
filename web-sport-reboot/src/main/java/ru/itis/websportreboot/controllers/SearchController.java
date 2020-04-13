package ru.itis.websportreboot.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import ru.itis.websportreboot.dto.ExercisesSearchResult;
import ru.itis.websportreboot.service.SearchService;

@RestController
@RequestMapping("/exercises")
public class SearchController {

    @Autowired
    private SearchService service;

    @GetMapping("/search")
    public ExercisesSearchResult searchExercises(
            @RequestParam("query") String query,
            @RequestParam("page") Integer page,
            @RequestParam("size") Integer size
    ) {
        ExercisesSearchResult res = service.search(query, page, size);
        System.out.println(res.getExercises().size() + " " + res.getCount());
        return res;
    }
}


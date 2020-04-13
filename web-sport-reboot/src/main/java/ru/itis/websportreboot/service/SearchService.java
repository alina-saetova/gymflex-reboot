package ru.itis.websportreboot.service;

import ru.itis.websportreboot.dto.ExercisesSearchResult;

public interface SearchService {

    ExercisesSearchResult search(String query, Integer page, Integer size);
}

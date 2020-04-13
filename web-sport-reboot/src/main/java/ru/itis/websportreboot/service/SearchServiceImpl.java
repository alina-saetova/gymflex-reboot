package ru.itis.websportreboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import ru.itis.websportreboot.dto.ExercisesSearchResult;
import ru.itis.websportreboot.models.Exercise;
import ru.itis.websportreboot.repositories.ExercisesRepository;

import java.util.List;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private ExercisesRepository exercisesRepository;

    @Override
    public ExercisesSearchResult search(String query, Integer page, Integer size) {
        PageRequest pageRequest = PageRequest.of(page, size);
        Page<Exercise> pageResult = exercisesRepository.search(query, pageRequest);
        List<Exercise> exercises = pageResult.getContent();
        return ExercisesSearchResult.builder()
                .exercises(exercises)
                .count(pageResult.getTotalPages())
                .build();
    }
}

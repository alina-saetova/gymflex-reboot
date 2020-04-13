package ru.itis.websportreboot.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.itis.websportreboot.models.Exercise;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ExercisesSearchResult {

    private List<Exercise> exercises;
    private Integer count;
}

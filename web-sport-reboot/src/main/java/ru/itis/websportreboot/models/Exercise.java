package ru.itis.websportreboot.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "sport_exercise")
public class Exercise {

    @Id
    private Long id;

    private String name;
    private String info;
    private int cnt_likes;
    private String photo;
    private String type;
}

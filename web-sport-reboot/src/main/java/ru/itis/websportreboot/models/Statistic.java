package ru.itis.websportreboot.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "sport_statistic")
public class Statistic {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Long articleId;
    private String stringDate;

    @PrePersist
    public void setDate() {
        Date date = new Date();
        SimpleDateFormat f = new SimpleDateFormat("dd.MM.yyyy hh:mm");
        this.stringDate = f.format(date);
    }
}

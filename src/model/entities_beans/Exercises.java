package model.entities_beans;

import java.io.Serializable;
import java.util.Calendar;
import java.util.List;

/**
 * Classe que cria o objeto exercicio.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class Exercises implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer code;
    private String exercises;
    private Calendar time;
    private Float calories;
    private Calendar day;

    public Exercises() {
    }

    public Exercises(Integer code, String exercises, Calendar time, Float calories, Calendar day) {
        this.code = code;
        this.exercises = exercises;
        this.time = time;
        this.calories = calories;
        this.day = day;
    }

    public Integer getCode() {
        return code;
    }

    public String getExercises() {
        return exercises;
    }

    public void setExercises(String exercises) {
        this.exercises = exercises;
    }

    public Calendar getTime() {
        return time;
    }

    public void setTime(Calendar time) {
        this.time = time;
    }

    public Float getCalories() {
        return calories;
    }

    public void setCalories(Float calories) {
        this.calories = calories;
    }

    public Calendar getDay() {
        return day;
    }

    public void setDay(Calendar day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "Exercises{" +
                "code=" + code +
                ", exercises='" + exercises + '\'' +
                ", time=" + time +
                ", calories=" + calories +
                ", day=" + day +
                '}';
    }
}


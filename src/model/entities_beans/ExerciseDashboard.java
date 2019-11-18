package model.entities_beans;

import java.io.Serializable;
import java.util.Calendar;

public class ExerciseDashboard implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double goal;
    private Double lostCalories;
    private Integer qtdExercises;
    private Calendar timeExercises;

    public ExerciseDashboard(){};

    public ExerciseDashboard(Double goal, Double lostCalories, Integer qtdExercises, Calendar timeExercises) {
        this.goal = goal;
        this.lostCalories = lostCalories;
        this.qtdExercises = qtdExercises;
        this.timeExercises = timeExercises;
    }

    public Double getGoal() {
        return goal;
    }

    public void setGoal(Double goal) {
        this.goal = goal;
    }

    public Double getLostCalories() {
        return lostCalories;
    }

    public void setLostCalories(Double lostCalories) {
        this.lostCalories = lostCalories;
    }

    public Integer getQtdExercises() {
        return qtdExercises;
    }

    public void setQtdExercises(Integer qtdExercises) {
        this.qtdExercises = qtdExercises;
    }

    public Calendar getTimeExercises() {
        return timeExercises;
    }

    public void setTimeExercises(Calendar timeExercises) {
        this.timeExercises = timeExercises;
    }
}

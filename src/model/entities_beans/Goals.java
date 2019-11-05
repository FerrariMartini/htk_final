package model.entities_beans;


import java.io.Serializable;

public class Goals implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double weightGoals;
    private Float litersGoals;
    private Double exercisesGoalCals;
    private Double foodGoalCals;

    public Goals() {
    }

    public Goals(Double weightGoals, Float litersGoals, Double exercisesGoalCals, Double foodGoalCals) {
        this.weightGoals = weightGoals;
        this.litersGoals = litersGoals;
        this.exercisesGoalCals = exercisesGoalCals;
        this.foodGoalCals = foodGoalCals;
    }

    public Double getWeightGoals() {
        return weightGoals;
    }

    public void setWeightGoals(Double weightGoals) {
        this.weightGoals = weightGoals;
    }

    public Float getLitersGoals() {
        return litersGoals;
    }

    public void setLitersGoals(Float litersGoals) {
        this.litersGoals = litersGoals;
    }

    public Double getExercisesGoalCals() {
        return exercisesGoalCals;
    }

    public void setExercisesGoalCals(Double exercisesGoalCals) {
        this.exercisesGoalCals = exercisesGoalCals;
    }

    public Double getFoodGoalCals() {
        return foodGoalCals;
    }

    public void setFoodGoalCals(Double foodGoalCals) {
        this.foodGoalCals = foodGoalCals;
    }
}

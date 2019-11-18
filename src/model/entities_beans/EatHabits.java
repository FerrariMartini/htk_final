package model.entities_beans;

import java.util.Calendar;

/**
 * Classe que cria o objeto hábitos alimentares.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class EatHabits {
    private Integer code;
    private String meal;
    private String food;
    private Float qtd;
    private Float portion;
    private Float calories;
    private Calendar day;

    public EatHabits(Integer code, String meal, String food, Float qtd, Float portion, Float calories, Calendar day) {
        this.code = code;
        this.meal = meal;
        this.food = food;
        this.qtd = qtd;
        this.portion = portion;
        this.calories = calories;
        this.day = day;
    }

    public Integer getCode() {
        return code;
    }

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public Float getQtd() {
        return qtd;
    }

    public void setQtd(Float qtd) {
        this.qtd = qtd;
    }

    public Float getPortion() {
        return portion;
    }

    public void setPortion(Float portion) {
        this.portion = portion;
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
}



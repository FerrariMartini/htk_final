package model.entities_beans;

import java.io.Serializable;

public class EatHabitsDashboard implements Serializable {
    private static final long serialVersionUID = 1L;

    private Double goal;
    private Double gainCalories;
    private Integer qtdCoffeTea;
    private Integer qtdSnack;
    private Integer qtdMainMeal;

    public EatHabitsDashboard() {
    }

    public EatHabitsDashboard(Double goal, Double gainCalories, Integer qtdCoffeTea, Integer qtdSnack, Integer qtdMainMeal) {
        this.goal = goal;
        this.gainCalories = gainCalories;
        this.qtdCoffeTea = qtdCoffeTea;
        this.qtdSnack = qtdSnack;
        this.qtdMainMeal = qtdMainMeal;
    }

    public Double getGoal() {
        return goal;
    }

    public void setGoal(Double goal) {
        this.goal = goal;
    }

    public Double getGainCalories() {
        return gainCalories;
    }

    public void setGainCalories(Double gainCalories) {
        this.gainCalories = gainCalories;
    }

    public Integer getQtdCoffeTea() {
        return qtdCoffeTea;
    }

    public void setQtdCoffeTea(Integer qtdCoffeTea) {
        this.qtdCoffeTea = qtdCoffeTea;
    }

    public Integer getQtdSnack() {
        return qtdSnack;
    }

    public void setQtdSnack(Integer qtdSnack) {
        this.qtdSnack = qtdSnack;
    }

    public Integer getQtdMainMeal() {
        return qtdMainMeal;
    }

    public void setQtdMainMeal(Integer qtdMainMeal) {
        this.qtdMainMeal = qtdMainMeal;
    }

    @Override
    public String toString() {
        return "EatHabitsDashboard{" +
                "goal=" + goal +
                ", gainCalories=" + gainCalories +
                ", qtdCoffeTea=" + qtdCoffeTea +
                ", qtdSnack=" + qtdSnack +
                ", qtdMainMeal=" + qtdMainMeal +
                '}';
    }
}

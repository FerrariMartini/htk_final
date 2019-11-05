package model.entities_beans;

import java.util.List;

/**
 * Classe que cria o objeto hábitos alimentares.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class EatHabits {
    private String meal;
    private String food;
    private Float qtd;
    private Float portion;
    private Float calories;

    public EatHabits(String meal, String food, Float qtd, Float portion, Float calories) {
        this.meal = meal;
        this.food = food;
        this.qtd = qtd;
        this.portion = portion;
        this.calories = calories;
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


    /**
     * Salvar os dados dos habitos alimentares no BD,
     * @param: uma lista com os dados de todas a refeições realizadas.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean save(List<String> mealsList) {
        boolean isSave = false;

        return isSave;
    }

    /**
     * Deletar a refeicão do BD,
     * @param: meal é uma key para indicar qual refeição e index é o valor indicando qual a comida.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean delete(String meal, int index) {
        boolean isDelete = false;
        return isDelete;
    }
}



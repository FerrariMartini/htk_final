package model.entities_beans;

import java.io.Serializable;
import java.util.List;

/**
 * Classe que cria o objeto exercicio.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class Exercises implements Serializable {

    private static final long serialVersionUID = 1L;

    private String exercises;
    private String time;
    private Float calories;


    public Exercises() {

    }

    public Exercises(String exercises, String time, Float calories) {
        this.exercises = exercises;
        this.time = time;
        this.calories = calories;
    }

    public String getExercises() {
        return exercises;
    }

    public void setExercises(String exercises) {
        this.exercises = exercises;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Float getCalories() {
        return calories;
    }

    public void setCalories(Float calories) {
        this.calories = calories;
    }

    /**
     * Salvar os dados dos exercícios no BD,
     *
     * @param: uma lista com os dados de todas os exercicios realizadas.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean save(List<String> exercisesList) {
        boolean isSave = false;

        return isSave;
    }

    /**
     * Deletar a refeicão do BD,
     *
     * @param: index para indicar qual o exercício da lista será removido.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean delete(int index) {
        boolean isDelete = false;
        return isDelete;
    }
}


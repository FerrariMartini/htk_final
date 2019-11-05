package model.entities_beans;

/**
 * Classe que cria o dia atual para o usuário inserir os dados.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import java.io.Serializable;
import java.util.Calendar;

public class Today implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double weightDay;
    private Calendar day;
    private Double currentImc;

    public Today() {
    }

    public Today(Double weightDay, Calendar day) {
        this.weightDay = weightDay;
        this.day = day;
    }

    public Double getWeightDay() {
        return weightDay;
    }

    public void setWeightDay(Double weightDay) {
        this.weightDay = weightDay;
    }

    public Calendar getDay() {
        return day;
    }

    public void setDay(Calendar day) {
        this.day = day;
    }

    public double getCurrentImc() {
        return this.currentImc;
    }


    /**
     * calcular o IMC atual,
     *
     * @param: weightDay é o peso atualmente informado e initHeight é a atual informada no cadastro.
     * @return: deve retornar um double para ser mostrado ao usuário.
     */
    public double currentImc(double initHeight) {
        return this.currentImc = weightDay / (initHeight * initHeight);
    }
}


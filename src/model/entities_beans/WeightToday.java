package model.entities_beans;

/**
 * Classe que cria o dia atual para o usuário inserir os dados.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import java.io.Serializable;
import java.util.Date;

public class WeightToday implements Serializable {

    private static final long serialVersionUID = 1L;

    private Date day;
    private Double weightDay;
    private Double currentImc;

    public WeightToday() {
    }

    public WeightToday(Double weightDay, Date day, Double currentImc) {
        this.weightDay = weightDay;
        this.day = day;
        this.currentImc = currentImc;
    }

    public Double getWeightDay() {
        return weightDay;
    }

    public void setWeightDay(Double weightDay) {
        this.weightDay = weightDay;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public double getCurrentImc() {
        return this.currentImc;
    }

}


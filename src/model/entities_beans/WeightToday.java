package model.entities_beans;

/**
 * Classe que cria o dia atual para o usuário inserir os dados.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import java.io.Serializable;
import java.util.Calendar;

public class WeightToday implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer code;
    private Calendar day;
    private Double weightDay;
    private Double currentImc;

    public WeightToday() {
    }

    public WeightToday(Integer code, Double weightDay, Calendar day, Double currentImc) {
        this.code = code;
        this.weightDay = weightDay;
        this.day = day;
        this.currentImc = currentImc;
    }

    public Integer getCode() {
        return code;
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

    public void setCurrentImc(Double currentImc) {
        this.currentImc = currentImc;
    }

    @Override
    public String toString() {
        return "WeightToday{" +
                "code=" + code +
                ", day=" + day +
                ", weightDay=" + weightDay +
                ", currentImc=" + currentImc +
                '}';
    }
}


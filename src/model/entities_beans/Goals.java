package model.entities_beans;


import java.io.Serializable;

public class Goals implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer code;
    private String descptGoal;
    private Double qtdGoal;

    public Goals() {
    }

    public Goals(Integer code, String descptGoal, Double qtdGoal) {
        this.code = code;
        this.descptGoal = descptGoal;
        this.qtdGoal = qtdGoal;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getDescptGoal() {
        return descptGoal;
    }

    public void setDescptGoal(String descptGoal) {
        this.descptGoal = descptGoal;
    }

    public Double getQtdGoal() {
        return qtdGoal;
    }

    public void setQtdGoal(Double qtdGoal) {
        this.qtdGoal = qtdGoal;
    }
}

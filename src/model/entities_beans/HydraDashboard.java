package model.entities_beans;

import java.io.Serializable;

public class HydraDashboard implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double goal;
    private Double gainHydra;
    private Integer qtdGalss;

    public HydraDashboard() {
    }

    public HydraDashboard(Double goal, Double gainWater, Integer qtdGalss) {
        this.goal = goal;
        this.gainHydra = gainWater;
        this.qtdGalss = qtdGalss;
    }

    public Double getGoal() {
        return goal;
    }

    public void setGoal(Double goal) {
        this.goal = goal;
    }

    public Double getGainHydra() {
        return gainHydra;
    }

    public void setGainHydra(Double gainHydra) {
        this.gainHydra = gainHydra;
    }

    public Integer getQtdGalss() {
        return qtdGalss;
    }

    public void setQtdGalss(Integer qtdGalss) {
        this.qtdGalss = qtdGalss;
    }
}

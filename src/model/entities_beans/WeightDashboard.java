package model.entities_beans;

import java.io.Serializable;

public class WeightDashboard implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double goal;
    private Double lost;
    private Double lastWight;
    private Double initWeight;

    public WeightDashboard() {
    }

    public WeightDashboard(Double goal, Double lost, Double lastWight, Double initWeight) {
        this.goal = goal;
        this.lost = lost;
        this.lastWight = lastWight;
        this.initWeight = initWeight;
    }

    public Double getGoal() {
        return goal;
    }

    public void setGoal(Double goal) {
        this.goal = goal;
    }

    public Double getLost() {
        return lost;
    }

    public void setLost(Double lost) {
        this.lost = lost;
    }

    public Double getLastWight() {
        return lastWight;
    }

    public void setLastWight(Double lastWight) {
        this.lastWight = lastWight;
    }

    public Double getInitWeight() {
        return initWeight;
    }

    public void setInitWeight(Double initWeight) {
        this.initWeight = initWeight;
    }

    @Override
    public String toString() {
        return "WeightDashboard{" +
                "goal=" + goal +
                ", lost=" + lost +
                ", lastWight=" + lastWight +
                ", initWeight=" + initWeight +
                '}';
    }
}

package model.entities_beans;

import java.io.Serializable;

public class WeightDashboard implements Serializable {

    private static final long serialVersionUID = 1L;

    private Double goal;
    private Double lost;
    private Double lastWeight;
    private Double initWeight;

    public WeightDashboard() {
    }

    public WeightDashboard(Double goal, Double lost, Double lastWeight, Double initWeight) {
        this.goal = goal;
        this.lost = lost;
        this.lastWeight = lastWeight;
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

    public Double getLastWeight() {
        return lastWeight;
    }

    public void setLastWeight(Double lastWeight) {
        this.lastWeight = lastWeight;
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
                ", lastWight=" + lastWeight +
                ", initWeight=" + initWeight +
                '}';
    }
}

package model.entities_beans;

import java.io.Serializable;

public class PresImcDashboard implements Serializable {

    private static final long serialVersionUID = 1L;

    private double goal;
    private double imcCurrent;
    private double mmAvgPressure;
    private double hgAvgPressure;

    public PresImcDashboard() {
    }

    public PresImcDashboard(double goal, double imcCurrent, double mmAvgPressure, double hgAvgPressure) {
        this.goal = goal;
        this.imcCurrent = imcCurrent;
        this.mmAvgPressure = mmAvgPressure;
        this.hgAvgPressure = hgAvgPressure;
    }

    public double getGoal() {
        return goal;
    }

    public void setGoal(double goal) {
        this.goal = goal;
    }

    public double getImcCurrent() {
        return imcCurrent;
    }

    public void setImcCurrent(double imcCurrent) {
        this.imcCurrent = imcCurrent;
    }

    public double getMmAvgPressure() {
        return mmAvgPressure;
    }

    public void setMmAvgPressure(double mmAvgPressure) {
        this.mmAvgPressure = mmAvgPressure;
    }

    public double getHgAvgPressure() {
        return hgAvgPressure;
    }

    public void setHgAvgPressure(double hgAvgPressure) {
        this.hgAvgPressure = hgAvgPressure;
    }
}

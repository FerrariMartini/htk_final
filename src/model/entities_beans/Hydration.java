package model.entities_beans;

import java.io.Serializable;
import java.util.Calendar;

/**
 * Classe que cria o objeto hidratação .
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class Hydration implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;
    private Calendar data;
    private String glass;
    private Float unit;
    private Float qtd;

    public Hydration() {
    }

    public Hydration(Integer id, Calendar data, String glass, Float unit, Float qtd) {
        this.id = id;
        this.data = data;
        this.glass = glass;
        this.unit = unit;
        this.qtd = qtd;
    }

    public Integer getId() {
        return id;
    }

    public Calendar getData() {
        return data;
    }

    public void setData(Calendar data) {
        this.data = data;
    }

    public String getGlass() {
        return glass;
    }

    public void setGlass(String glass) {
        this.glass = glass;
    }

    public Float getUnit() {
        return unit;
    }

    public void setUnit(Float unit) {
        this.unit = unit;
    }

    public Float getQtd() {
        return qtd;
    }

    public void setQtd(Float qtd) {
        this.qtd = qtd;
    }
}

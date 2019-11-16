package model.entities_beans; /**
 * Classe que coleta os dados da pressão do usuário.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import java.io.Serializable;
import java.util.Calendar;

public class Pressure implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer code;
    private Integer sistolica_mm;
    private Integer sistolica_hg;
    private Calendar day;

    public Pressure() {

    }

    public Pressure(Integer code, Integer sistolica_mm, Integer sistolica_hg, Calendar day) {
        this.code = code;
        this.sistolica_mm = sistolica_mm;
        this.sistolica_hg = sistolica_hg;
        this.day = day;
    }

    public Integer getCode() {
        return code;
    }

    public Integer getSistolica_mm() {
        return sistolica_mm;
    }

    public void setSistolica_mm(Integer sistolica_mm) {
        this.sistolica_mm = sistolica_mm;
    }

    public Integer getSistolica_hg() {
        return sistolica_hg;
    }

    public void setSistolica_hg(Integer sistolica_hg) {
        this.sistolica_hg = sistolica_hg;
    }

    public Calendar getDay() {
        return day;
    }

    public void setDay(Calendar day) {
        this.day = day;
    }
}

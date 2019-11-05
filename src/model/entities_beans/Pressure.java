package model.entities_beans; /**
 * Classe que coleta os dados da pressão do usuário.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import java.io.Serializable;
import java.util.Date;

public class Pressure implements Serializable {

    private static final long serialVersionUID = 1L;

    private int code;
    private int sistolica_mm;
    private int sistolica_hg;
    private Date date;

    public Pressure() {

    }

    public Pressure(int code, int sistolica_mm, int sistolica_hg, Date date) {
        this.code = code;
        this.sistolica_mm = sistolica_mm;
        this.sistolica_hg = sistolica_hg;
        this.date = date;
    }

    public int getSistolica_mm() {
        return sistolica_mm;
    }

    public void setSistolica_mm(int sistolica_mm) {
        this.sistolica_mm = sistolica_mm;
    }

    public int getSistolica_hg() {
        return sistolica_hg;
    }

    public void setSistolica_hg(int sistolica_hg) {
        this.sistolica_hg = sistolica_hg;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getCode() {
        return code;
    }
}

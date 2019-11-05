package model.entities_beans;
/**
 * Classe que cria o objeto usuário.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public final class User extends People implements Serializable {

    private static final long serialVersionUID = 1L;

    public static SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");

    private Calendar birthday;
    private Character gender;
    private String pwd;
    private Double initWeight;
    private Double initHeight;
    private Double initIMC;
    private BusinessPlan type;

    public User() {

    }

    public User(String id, String name, String lastName, String phone, String email,
                Calendar birthday, Character gender, String pwd, Double initWeight, Double initHeight,
                BusinessPlan type) {
        super(id, name, lastName, phone, email);
        this.birthday = birthday;
        this.gender = gender;
        this.pwd = pwd;
        this.initWeight = initWeight;
        this.initHeight = initHeight;
        this.initIMC = evaluateImc(initWeight, initHeight);
        this.type = type;

    }

    public Calendar getBirthday() {
        return birthday;
    }

    public Character getGender() {
        return gender;
    }

    /**
     * Será permitido apenas inserir/alterar senha somente via construtor ou método Update.
     * public void setPwd(String pwd) {
     * this.pwd = pwd;
     * }
     */

    public String getPwd() {
        return pwd;
    }

    public double getInitWeight() {
        return initWeight;
    }

    /* Será permitido apenas inserir peso inicial pelo construtor.
    public void setInitWeight(Float initWeight) {
        this.initWeight = initWeight;
    }*/

    public double getInitHeight() {
        return initHeight;
    }

    /* Será permitido apenas inserir altura pelo construtor.

    public void setInitHeight(Float initHeight) {
        this.initHeight = initHeight;
    }*/

    public double getInitIMC() {
        return initIMC;
    }

    /* IMC inicial será calculado e inserido via por método.
    public void setInitIMC(Float initIMC) {
        this.initIMC = initIMC;
    }*/

    public String getType() {
        return type.toString();
    }

    public void setType(BusinessPlan type) {
        this.type = type;
    }

    /**
     * metodo publico para fazer o calculo inicial do IMC.
     *
     * @param: peso inicial e altura inicial.
     * @return: deve retornar um valor float que é o IMC e adicionar na variável initIMC;
     */
    private double evaluateImc(double initWeight, double initHeight) {
        return initWeight / (initHeight * initHeight);
    }
}

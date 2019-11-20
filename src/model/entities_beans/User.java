package model.entities_beans;
/**
 * Classe que cria o objeto usuário.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import model.service.ImcCaculation;

import java.io.Serializable;
import java.util.Calendar;

public final class User extends People implements Serializable {

    private static final long serialVersionUID = 1L;

    private Calendar birthday;
    private String gender;
    private String pwd;
    private Double initWeight;
    private Double initHeight;
    private Double initIMC;
    private BusinessPlan type;

    public User(Long id, String name, String lastName, String phone, String email,
                Calendar birthday, String gender, String pwd, Double initWeight, Double initHeight,
                BusinessPlan type) {
        super(id, name, lastName, phone, email);
        this.birthday = birthday;
        this.gender = gender;
        this.pwd = pwd;
        this.initWeight = initWeight;
        this.initHeight = initHeight;
        this.initIMC = ImcCaculation.evaluateImc(initWeight, initHeight);
        this.type = type;

    }

    public Calendar getBirthday() {
        return birthday;
    }

    public String getGender() {
        return gender;
    }

    public String getPwd() {
        return pwd;
    }

    public double getInitWeight() {
        return initWeight;
    }

    public double getInitHeight() {
        return initHeight;
    }

    public double getInitIMC() {
        return initIMC;
    }

    public String getType() {
        return type.getType();
    }

    public void setType(BusinessPlan type) {
        this.type = type;
    }

    //TODO - entender como montar a criptografica e comparar a pwd criptografada com a que virá no login de acesso.
//    private void setPwd(String pwd) {
//        try {
//            this.pwd = CriptografiaUtil.criptografar(pwd);
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//            e.printStackTrace();
//        }
//    }

    @Override
    public String toString() {
        return "User{" +
                "birthday=" + birthday +
                ", gender=" + gender +
                ", pwd='" + pwd + '\'' +
                ", initWeight=" + initWeight +
                ", initHeight=" + initHeight +
                ", initIMC=" + initIMC +
                ", type=" + type +
                ", cpf_id='" + cpf_id + '\'' +
                ", name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}


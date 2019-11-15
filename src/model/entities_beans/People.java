package model.entities_beans;

import java.io.Serializable;

/**
 * Classe abstrata de pessoas que irá permitir herança das classes entities e User e Emergency Contact.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public abstract class People implements Serializable {

    private static final long serialVersionUID = 1L;

    protected String cpf_id;
    protected String name;
    protected String lastName;
    protected String phone;
    protected String email;

    protected People() {

    }

    protected People(String cpf_id, String name, String lastName, String phone, String email) {
        this.cpf_id = cpf_id;
        this.name = name;
        this.lastName = lastName;
        this.phone = phone;
        this.email = email;
    }

    /**
     * Com excessão ao setPhone, não há setters pois não será permitida alteração de nome depois de cadastrado e salvo no BD.
     * para qualquer correção o usuário deverá apagar o cadastro e fazer um novo.
     */

    public String getCpf_id() {
        return cpf_id;
    }

    public String getName() {
        return name;
    }

    public String getLastName() {
        return lastName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}

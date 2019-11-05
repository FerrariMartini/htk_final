package model.entities_beans;

import java.io.Serializable;

/**
 * Classe que cria o objeto tipo de plano comercial que o usuário terá.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class BusinessPlan implements Serializable {

    private static final long serialVersionUID = 1L;


    public static final double PRICE = 4.99;
    private String type;

    public BusinessPlan() {
    }

    public BusinessPlan(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }

    /**
     * Realiza a chamada da operação de pagamento com a operadora de cartão.
     *
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean validatePayment() {
        boolean isPaied = false;
        return isPaied;
    }
}

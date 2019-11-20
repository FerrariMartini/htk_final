package model.entities_beans;

/**
 * Classe que cria o objeto Contato de Emergêbncia.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public final class EmergencyContact extends People {
    private String kinship;
    private Integer code;

    public EmergencyContact() {
    }

    public EmergencyContact(Integer code, String name, String lastName, String phone, String email, String kinship, Long cpf_id) {
        super(cpf_id, name, lastName, phone, email);
        this.kinship = kinship;
        this.code = code;
    }

    public String getKinship() {
        return kinship;
    }

    public void setKinship(String kinship) {
        this.kinship = kinship;
    }

    public Integer getCode() {
        return code;
    }

    @Override
    public String toString() {
        return "entities.EmergencyContact{" +
                "id=" + cpf_id +
                ", name='" + name + '\'' +
                ", lastName='" + lastName + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", kinship='" + kinship + '\'' +

                '}';
    }
}

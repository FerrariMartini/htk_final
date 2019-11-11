package model.entities_beans;

/**
 * Classe que cria o objeto Contato de Emergêbncia.
 *
 * @author Ivan Martini
 * @version 1.3
 */

public final class EmergencyContact extends People {
    private String kinship;

    public EmergencyContact() {
    }

    public EmergencyContact(String id, String name, String lastName, String phone, String email, String kinship) {
        super(id, name, lastName, phone, email);
        this.kinship = kinship;
    }

    public String getKinship() {
        return kinship;
    }

    public void setKinship(String kinship) {
        this.kinship = kinship;
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

package model.entities_beans;

import java.io.Serializable;
import java.util.List;

/**
 * Classe que cria o objeto hidratação .
 *
 * @author Ivan Martini
 * @version 1.3
 */

public class Hydration implements Serializable {

    private static final long serialVersionUID = 1L;

    private String glass;
    private Float qtd;


    public Hydration() {

    }

    public Hydration(String glass, Float qtd) {
        this.glass = glass;
        this.qtd = qtd;
    }

    public String getGlass() {
        return glass;
    }

    public void setGlass(String glass) {
        this.glass = glass;
    }

    public Float getQtd() {
        return qtd;
    }

    public void setQtd(Float qtd) {
        this.qtd = qtd;
    }

    /**
     * Salvar os dados da quantidade de líquido ingerido pelo usuário  no BD,
     * @param: uma lista com os dados de quantidade de água e qual embalagem.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean save(List<String> hydraList) {
        boolean isSave = false;

        return isSave;
    }

    /**
     * Deletar uma embalagem do BD,
     * @param: index para indicar qual o exercício da lista será removido.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    public boolean delete(int index) {
        boolean isDelete = false;
        return isDelete;
    }
}

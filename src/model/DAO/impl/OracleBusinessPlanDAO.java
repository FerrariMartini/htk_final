package model.DAO.impl;

/**
 * Classe que realiza a interface com BD para CRUD do tipo de plano comercial.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import model.entities_beans.BusinessPlan;

import java.util.ArrayList;
import java.util.List;

public class OracleBusinessPlanDAO {

    // Classe que é uma interface entre a classe entities e o banco de dados para
    // realizar o CRUD.

    // apenas para simular o sucesso da Query SQL para o banco, vamos retornar uma lista com os objetos criados.
    public List<BusinessPlan> getAll() {

        List<BusinessPlan> businessPlanList = new ArrayList<>();

        BusinessPlan bp1 =  new BusinessPlan("Free");
        BusinessPlan bp2 =  new BusinessPlan("Premium");

        businessPlanList.add(bp1);
        businessPlanList.add(bp2);

        return businessPlanList;

    }

    /**
     * Salva no banco de dados a informação sobre a pressão arterial do usuário.
     *
     * @param: será necessário passar uma lista de pressões arteriais aferidas.
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     * @see: deletar
     */
    public boolean save(List<String> pressureList) {
        boolean isSave = false;
        return isSave;
    }

    /**
     * Deleta no banco de dados a informação sobre a pressão arterial do usuário.
     *
     * @param: será necessário passar o index do elemento da lista de pressão arterial.
     * @return: deve retornar um valor booleano notificando se o(s) dado(s) foram removidos ou não.
     */
    public boolean deletePressure(int index) {
        boolean isDeleted = false;
        return isDeleted;
    }



}

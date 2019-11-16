package model.DAO;


import model.DBException.DBException;
import model.entities_beans.WeightToday;

import java.util.Calendar;
import java.util.List;

public interface WeightTodayDAO {

    //salvar uma classe WeightToday no banco
    boolean create(WeightToday weightToday, Long cpf_id) throws DBException;

    //ler os dados de uma data específica. Usado no dashboard.
    List<WeightToday> readWeight(Calendar date, Long cpf_id) throws DBException;

}

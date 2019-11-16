package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Goals;
import model.entities_beans.WeightToday;

import java.util.Calendar;
import java.util.List;

public interface GoalsDAO {

    boolean create(Goals goals, Long cpf_id) throws DBException;

    //ler os dados de uma data específica. Usado no dashboard.
    List<Goals> readGoals(Long cpf_id) throws DBException;

    void update(Double goalItem, int code) throws DBException;
}

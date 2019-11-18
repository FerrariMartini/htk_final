package model.DAO;


import model.DBException.DBException;
import model.entities_beans.EatHabits;

import java.util.Calendar;
import java.util.List;

public interface EatHabitsDAO {

     boolean create(EatHabits food, Long cpd_id) throws DBException;

     List<EatHabits> read(Calendar date, Long cpf_id) throws DBException;

}

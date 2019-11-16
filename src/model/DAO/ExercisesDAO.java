package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Exercises;

import java.util.Calendar;
import java.util.List;

public interface ExercisesDAO {
    boolean create(Exercises exercise, Long cpf_id) throws DBException;

    List<Exercises> read(Calendar date, Long cpf_id) throws DBException;
}

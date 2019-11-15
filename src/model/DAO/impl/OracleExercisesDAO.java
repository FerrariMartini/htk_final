package model.DAO.impl;

import model.DAO.ExercisesDAO;
import model.DBException.DBException;
import model.entities_beans.Exercises;

import java.util.Date;

public class OracleExercisesDAO implements ExercisesDAO {

    @Override
    public boolean create(Exercises exercise, Date data) throws DBException {
        return true;
    }

    @Override
    public Exercises read() throws DBException {
        return null;
    }

    @Override
    public void update(Exercises exercises) throws DBException {

    }

    @Override
    public void delete(String cpfId, String pwd) throws DBException {

    }
}

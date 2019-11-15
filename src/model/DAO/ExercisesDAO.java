package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Exercises;
import model.entities_beans.User;

import java.util.Date;

public interface ExercisesDAO {
     boolean create(Exercises exercise, Date hoje) throws DBException;

     Exercises read() throws DBException;

     void update(Exercises exercises) throws DBException;

     void delete(String cpfId, String pwd) throws DBException;
}

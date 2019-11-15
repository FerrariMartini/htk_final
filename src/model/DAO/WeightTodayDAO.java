package model.DAO;


import model.DBException.DBException;
import model.entities_beans.WeightToday;

public interface WeightTodayDAO {

    boolean create(WeightToday weightToday) throws DBException;


}

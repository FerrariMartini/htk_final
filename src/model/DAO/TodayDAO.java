package model.DAO;


import model.DBException.DBException;
import model.entities_beans.Today;
import model.entities_beans.User;

public interface TodayDAO {

    public void create(Today today) throws DBException;



}

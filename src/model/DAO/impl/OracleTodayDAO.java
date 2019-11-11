package model.DAO.impl;

import model.DAO.TodayDAO;
import model.DBException.DBException;
import model.entities_beans.Today;

public class OracleTodayDAO implements TodayDAO {

    @Override
    public boolean create(Today today) throws DBException {
        return false;
    }
}

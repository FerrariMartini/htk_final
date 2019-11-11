package model.DAO.impl;

import model.DAO.GoalsDAO;
import model.DBException.DBException;
import model.entities_beans.Goals;

public class OracleGoalsDAO implements GoalsDAO {

    @Override
    public boolean create(Goals goals) throws DBException {
        return false;
    }

    @Override
    public void update(Double goalItem) throws DBException {

    }
}

package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Goals;

public interface GoalsDAO {

    public boolean create(Goals goals) throws DBException;

    public void update(Double goalItem) throws DBException;

}

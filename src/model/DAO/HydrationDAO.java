package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Hydration;

import java.util.Date;

public interface HydrationDAO {

    boolean create(Hydration hydration) throws DBException;

}

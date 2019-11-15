package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Pressure;

import java.util.Date;
import java.util.List;

public interface PressureDAO {

    public boolean create(Pressure pressure, Date today) throws DBException;

    public List<Pressure> getAll();

    public void update(Pressure pressure);

    public void delete(int code);

}

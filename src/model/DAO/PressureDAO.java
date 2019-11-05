package model.DAO;

import model.entities_beans.Pressure;

import java.util.List;

public interface PressureDAO {

    public void create(Pressure pressure);

    public List<Pressure> getAll();

    public void update(Pressure pressure);

    public void delete(int code);

}

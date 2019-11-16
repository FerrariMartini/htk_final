package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Pressure;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public interface PressureDAO {

    boolean create(Pressure pressure, String cpf_id) throws DBException;

    List<Pressure> read(Calendar date, String cpf_id) throws DBException;

    void update(Pressure pressure) throws DBException;

    void delete(int code) throws DBException;
}

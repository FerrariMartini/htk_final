package model.DAO;

import model.DBException.DBException;
import model.entities_beans.Hydration;

import java.util.Calendar;
import java.util.List;

public interface HydrationDAO {

    boolean create(Hydration hydration, Long cpf_id) throws DBException;

    //ler os dados de uma data específica. Usado no dashboard.
    List<Hydration> readHydra(Calendar date, Long cpf_id) throws DBException;

}

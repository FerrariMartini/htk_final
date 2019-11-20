package model.DAO;

import model.DBException.DBException;
import model.entities_beans.EmergencyContact;

public interface EmContDAO {
    EmergencyContact read(long cpfId) throws DBException;

    void update(EmergencyContact emergencyContact) throws DBException;
}

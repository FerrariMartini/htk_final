package model.DAO;

import model.DBException.DBException;
import model.entities_beans.EmergencyContact;
import model.entities_beans.User;

public interface UserDAO {

    public void create(User user, EmergencyContact ec) throws DBException;

    public void update(User user) throws DBException;

    public void delete(String cpfId, String pwd) throws DBException;
}

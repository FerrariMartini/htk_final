package model.DAO;

import model.DBException.DBException;
import model.entities_beans.EmergencyContact;
import model.entities_beans.User;

public interface UserDAO {

    boolean create(User user, EmergencyContact ec) throws DBException;

    User read(String email, String pwd) throws DBException;

    void update(String email, String phone, String plano, Long cpf_id) throws DBException;

    void delete(Long cpfId, String pwd) throws DBException;

    void upPwd(String userPwd, Long cpf_id) throws DBException;
}

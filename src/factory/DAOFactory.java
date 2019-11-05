package factory;

import model.DAO.PressureDAO;
import model.DAO.UserDAO;
import model.DAO.impl.OraclePressureDAO;
import model.DAO.impl.OracleUserDAO;

public class DAOFactory {

    public static UserDAO getUserDAO() {
        return new OracleUserDAO();
    }

    public static PressureDAO getPressureDAO() {
        return new OraclePressureDAO();
    }
}

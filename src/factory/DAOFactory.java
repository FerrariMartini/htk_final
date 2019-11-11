package factory;

import model.DAO.GoalsDAO;
import model.DAO.PressureDAO;
import model.DAO.TodayDAO;
import model.DAO.UserDAO;
import model.DAO.impl.OracleGoalsDAO;
import model.DAO.impl.OraclePressureDAO;
import model.DAO.impl.OracleTodayDAO;
import model.DAO.impl.OracleUserDAO;

public class DAOFactory {

    public static UserDAO getUserDAO() {
        return new OracleUserDAO();
    }

    public static PressureDAO getPressureDAO() {
        return new OraclePressureDAO();
    }

    public static GoalsDAO getGoalsDAO() {
        return new OracleGoalsDAO();
    }

    public static TodayDAO getTodayDAO() {
        return new OracleTodayDAO();
    }
}

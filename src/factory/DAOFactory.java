package factory;

import model.DAO.*;
import model.DAO.impl.*;
import model.entities_beans.EatHabits;

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

    public static WeightTodayDAO getWeightTodayDAO() {
        return new OracleWeightTodayDAO();
    }

    public static ExercisesDAO getExercisesDAO() {
        return new OracleExercisesDAO();
    }

    public static HydrationDAO getHydraDAO() {
        return new OracleHydrationDAO();
    }

    public static EatHabitsDAO getEatHabitsDAO(){ return new OracleEatHabitsDAO();}


}

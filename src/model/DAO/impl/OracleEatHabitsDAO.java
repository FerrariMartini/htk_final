package model.DAO.impl;

import model.DAO.EatHabitsDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.EatHabits;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class OracleEatHabitsDAO implements EatHabitsDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private boolean isCreate = false;

    @Override
    public boolean create(EatHabits food, Long cpf_id) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = "INSERT INTO T_HT_FOOD (CD_FOOD, DS_MEAL, DS_FOOD, VL_PORCAO, NR_QTD, VL_CALORIAS, DT_DATA, CD_CPF) " +
                    "VALUES (SQ_FOOD.NEXTVAL, ? , ? , ? , ? , ? , ?, ? )";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, food.getMeal());
            stmt.setString(2, food.getFood());
            stmt.setFloat(3, food.getPortion());
            stmt.setFloat(4, food.getQtd());
            stmt.setFloat(5, food.getCalories());
            java.sql.Date data = new java.sql.Date(food.getDay().getTimeInMillis());
            stmt.setDate(6, data);
            stmt.setLong(7, cpf_id);


            int sucess = stmt.executeUpdate();
            System.out.println(sucess);

            if (sucess == 1) {
                isCreate = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar o dia");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                e.getMessage();
            }
        }

        return isCreate;
    }

    @Override
    public List<EatHabits> read(Calendar date, Long cpf_id) throws DBException {
        List<EatHabits> eatHabitsList = new ArrayList<>();
        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_FOOD WHERE DT_DATA = ? AND CD_CPF = ?";

            stmt = connection.prepareStatement(sql);
            java.sql.Date data = new java.sql.Date(date.getTimeInMillis());
            stmt.setDate(1, data);
            stmt.setLong(2, cpf_id);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int codeDB = rs.getInt("CD_FOOD");
                String dsMealDB = rs.getString("DS_MEAL");
                String dsFoodDB = rs.getString("DS_FOOD");
                float portionDB = rs.getFloat("VL_PORCAO");
                float qtdDB = rs.getFloat("NR_QTD");
                float caloriasDB = rs.getFloat("VL_CALORIAS");
                java.sql.Date dataDB = rs.getDate("DT_DATA");
                Calendar dtDB = Calendar.getInstance();
                dtDB.setTimeInMillis(dataDB.getTime());

                EatHabits eth = new EatHabits(codeDB, dsMealDB, dsFoodDB, qtdDB, portionDB, caloriasDB, dtDB);
                eatHabitsList.add(eth);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        return eatHabitsList;
    }
}

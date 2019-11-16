package model.DAO.impl;

import model.DAO.ExercisesDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.Exercises;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class OracleExercisesDAO implements ExercisesDAO {
    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private boolean isCreate = false;

    @Override
    public boolean create(Exercises exercise, Long cpf_id) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = "INSERT INTO T_HT_EXERC(CD_EXERC, NM_ATIV_FISICA, VL_TEMPO, DT_DIA, VL_CALORIAS, CD_CPF)" +
                    "VALUES (SQ_EXE.NEXTVAL, ?, ?, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, exercise.getExercises());
            java.sql.Date time = new java.sql.Date(exercise.getTime().getTimeInMillis());
            stmt.setDate(2, time);
            java.sql.Date data = new java.sql.Date(exercise.getDay().getTimeInMillis());
            stmt.setDate(3, data);
            stmt.setFloat(4, exercise.getCalories());
            stmt.setLong(5, cpf_id);

            stmt.executeUpdate();

            isCreate = true;

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
    public List<Exercises> read(Calendar date, Long cpf_id) throws DBException {
        List<Exercises> exercisesList = new ArrayList<>();

        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_EXERC WHERE DT_DIA = ? AND CD_CPF = ?";

            stmt = connection.prepareStatement(sql);

            java.sql.Date data = new java.sql.Date(date.getTimeInMillis());
            stmt.setDate(1, data);
            stmt.setLong(2, cpf_id);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int code = rs.getInt("CD_EXERC");
                String nomeExer = rs.getString("NM_ATIV_FISICA");

                java.sql.Date time = rs.getDate("VL_TEMPO");
                Calendar tm = Calendar.getInstance();
                tm.setTimeInMillis(time.getTime());

                float cal = rs.getFloat("VL_CALORIAS");

                java.sql.Date today = rs.getDate("DT_DIA");
                Calendar day = Calendar.getInstance();
                day.setTimeInMillis(time.getTime());

                Exercises ex = new Exercises(code, nomeExer, tm, cal, day);

                exercisesList.add(ex);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
            throw new DBException("Erro ao realizar o READ do dia");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                e.getMessage();
            }
        }
        return exercisesList;
    }
}

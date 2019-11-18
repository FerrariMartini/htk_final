package model.DAO.impl;

import model.DAO.WeightTodayDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.WeightToday;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class OracleWeightTodayDAO implements WeightTodayDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private boolean isCreate = false;

    @Override
    public boolean create(WeightToday weightToday, Long cpf_id) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = "INSERT INTO T_HT_WEIGHTDAY(CD_CODE, VL_IMC_ATUAL, VL_PESO_DIA, DT_DIA, CD_CPF)" +
                    "VALUES (SQ_WEIGHT.NEXTVAL, ?, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setDouble(1, weightToday.getCurrentImc());
            stmt.setDouble(2, weightToday.getWeightDay());
            java.sql.Date data = new java.sql.Date(weightToday.getDay().getTimeInMillis());
            stmt.setDate(3, data);
            stmt.setLong(4, cpf_id);

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
    public List<WeightToday> readWeight(Calendar date, Long cpf_id) throws DBException {
        List<WeightToday> weightTodayList = new ArrayList<>();

        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_WEIGHTDAY WHERE DT_DIA = ? AND CD_CPF = ?";

            stmt = connection.prepareStatement(sql);

            java.sql.Date data = new java.sql.Date(date.getTimeInMillis());
            stmt.setDate(1, data);
            stmt.setLong(2, cpf_id);

            ResultSet rs = stmt.executeQuery();


            if (rs.next()) {
                int code = rs.getInt("CD_CODE");
                double imc = rs.getDouble("VL_IMC_ATUAL");
                double weight = rs.getDouble("VL_PESO_DIA");
                java.sql.Date day = rs.getDate("DT_DIA");
                Calendar weightDay = Calendar.getInstance();
                weightDay.setTimeInMillis(day.getTime());

                WeightToday wt = new WeightToday(code, weight, weightDay, imc);

                weightTodayList.add(wt);
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
        return weightTodayList;
    }
}

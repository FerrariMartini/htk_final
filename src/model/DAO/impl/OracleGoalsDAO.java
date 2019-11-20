package model.DAO.impl;

import model.DAO.GoalsDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.Goals;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OracleGoalsDAO implements GoalsDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private boolean isCreate = false;

    @Override
    public boolean create(Goals goals, Long cpf_id) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = "INSERT INTO T_HT_META (CD_META, NR_QTD, DS_META, CD_CPF) VALUES (SQ_META.NEXTVAL, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setDouble(1, goals.getQtdGoal());
            stmt.setString(2, goals.getDescptGoal());
            stmt.setLong(3, cpf_id);

            int sucess = stmt.executeUpdate();

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
    public List<Goals> readGoals(Long cpf_id) throws DBException {
        List<Goals> goalsList = new ArrayList<>();
        try {
            connection = DBConnectManager.getConnection();


            sql = "SELECT * FROM T_HT_META WHERE CD_CPF = ?";

            stmt = connection.prepareStatement(sql);

            stmt.setLong(1, cpf_id);

            ResultSet rs = stmt.executeQuery();


            while (rs.next()) {
                int code = rs.getInt("CD_META");
                double calories = rs.getDouble("NR_QTD");
                String dsMeta = rs.getString("DS_META");

                Goals gl = new Goals(code, dsMeta, calories);

                goalsList.add(gl);
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
        return goalsList;
    }

    @Override
    public void update(Double goalItem, int code) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = "UPDATE T_HT_META SET NR_QTD = ? WHERE CD_META = ? ";

            stmt = connection.prepareStatement(sql);
            stmt.setDouble(1, goalItem);
            stmt.setInt(2, code);


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}

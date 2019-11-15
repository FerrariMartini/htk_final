package model.DAO.impl;

import model.DAO.WeightTodayDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.WeightToday;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracleWeightTodayDAO implements WeightTodayDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private ResultSet rs = null;

    @Override
    public boolean create(WeightToday weightToday) throws DBException {

        boolean isCreate = true;

//        //TODO - criar esse script de
//
//        try {
//            connection = DBConnectManager.getConnection();
//
//            sql = "INSERT INTO T_HT_DAY()" +
//                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
//
//            stmt = connection.prepareStatement(sql);
//
//
//            stmt.executeUpdate();
//
//            isCreate = true;
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//            throw new DBException("Erro ao cadastrar o dia");
//        } finally {
//            try {
//                stmt.close();
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }

        return isCreate;
    }
}

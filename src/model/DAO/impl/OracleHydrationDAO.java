package model.DAO.impl;

import model.DAO.HydrationDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.Hydration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OracleHydrationDAO implements HydrationDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;

    @Override
    public boolean create(Hydration hydra) throws DBException {
        boolean isCreate = false;

        try {
            //vamos abrir a conexão
            connection = DBConnectManager.getConnection();

            //vamos inserir o Script SQL
            sql = "INSERT INTO T_HT_HIDRA";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, hydra.getGlass());
            stmt.setFloat(2, hydra.getQtd());
            stmt.setFloat(3, hydra.getUnit());

            java.sql.Date data = new java.sql.Date(hydra.getData().getTimeInMillis());
            stmt.setDate(4, data);

            stmt.executeUpdate();

            isCreate = true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar nova pressão");

        } catch (Exception ge) {
            ge.printStackTrace();
            System.out.println("Mensagem do CREATE " + ge.getMessage());
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isCreate;
    }
}

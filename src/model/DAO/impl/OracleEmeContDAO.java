package model.DAO.impl;

import model.DAO.EmContDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.EmergencyContact;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class OracleEmeContDAO implements EmContDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;

    @Override
    public void update(EmergencyContact ec) throws DBException {

        try {
            connection = DBConnectManager.getConnection();

            sql = "UPDATE T_HT_EMER SET nm_nome = ?, nm_sobrenome = ?, ds_parente = ?, " +
                    "ds_email = ?, nr_phone = ? WHERE cd_contato = ?";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, ec.getName());
            stmt.setString(2, ec.getLastName());
            stmt.setString(3, ec.getKinship());
            stmt.setString(4, ec.getEmail());
            stmt.setString(5, ec.getPhone());
            stmt.setInt(6, ec.getCode());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao atualizar contato de emergencia");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public EmergencyContact read(long cpfId) throws DBException {
        EmergencyContact ecRead = new EmergencyContact();

        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_EMER WHERE cd_cpf = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, cpfId);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int codeDb = rs.getInt("cd_contato");
                String nameDb = rs.getString("nm_nome");
                String lastNameDb = rs.getString("nm_sobrenome");
                String kinshipDb = rs.getString("ds_parente");
                String emailDb = rs.getString("ds_email");
                long userIdDb = rs.getLong("cd_cpf");
                String phoneDb = rs.getString("nr_phone");

                ecRead = new EmergencyContact(codeDb, nameDb, lastNameDb, phoneDb, emailDb, kinshipDb, userIdDb);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao ler contato de emergencia");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return ecRead;
    }
}

package model.DAO.impl;

import model.DAO.HydrationDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.Hydration;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class OracleHydrationDAO implements HydrationDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private boolean isCreate = false;

    @Override
    public boolean create(Hydration hydra, Long cpf_id) throws DBException {


        try {
            //vamos abrir a conexão
            connection = DBConnectManager.getConnection();

            //vamos inserir o Script SQL
            sql = "INSERT INTO T_HT_HIDRA (CD_HIDRA, DT_DIA, DS_COPO_AGUA, NM_UNIT, NM_QTD, CD_CPF) " +
                    "VALUES (SQ_HIDRA.NEXTVAL, ?, ? , ? , ?, ?)";

            stmt = connection.prepareStatement(sql);

            java.sql.Date data = new java.sql.Date(hydra.getData().getTimeInMillis());
            stmt.setDate(1, data);
            stmt.setString(2, hydra.getGlass());
            stmt.setFloat(3, hydra.getUnit());
            stmt.setFloat(4, hydra.getQtd());
            stmt.setLong(5, cpf_id);

            stmt.executeUpdate();

            isCreate = true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar sua hidratação");

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

    @Override
    public List<Hydration> readHydra(Calendar date, Long cpf_id) throws DBException {
        List<Hydration> hydraList = new ArrayList<>();

        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_HIDRA WHERE DT_DIA = ? AND CD_CPF = ?";

            stmt = connection.prepareStatement(sql);

            java.sql.Date data = new java.sql.Date(date.getTimeInMillis());
            stmt.setDate(1, data);
            stmt.setLong(2, cpf_id);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int code = rs.getInt("CD_HIDRA");

                java.sql.Date day = rs.getDate("DT_DIA");
                Calendar waterDay = Calendar.getInstance();
                waterDay.setTimeInMillis(day.getTime());

                String tGlass = rs.getString("DS_COPO_AGUA");
                float unit = rs.getFloat("NM_UNIT");
                float qtd = rs.getFloat("NM_QTD");

                Hydration hd = new Hydration(code, waterDay, tGlass, unit, qtd);

                hydraList.add(hd);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            e.getMessage();
            throw new DBException("Erro ao realizar o READ da hydratação");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
                e.getMessage();
            }
        }
        return hydraList;
    }
}

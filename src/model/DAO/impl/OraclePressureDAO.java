package model.DAO.impl; /**
 * Classe que reailzar a interface com BD para CRUD da pressão do usuário.
 *
 * @author Ivan Martini
 * @version 1.3
 */

import model.DAO.PressureDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.Pressure;

import java.sql.*;
import java.util.List;

public class OraclePressureDAO implements PressureDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;

    /**
     * Salva no banco de dados a informação sobre a pressão arterial do usuário.
     *
     * @param: será necessário passar o objeto pressão arterial aferida.
     */
    @Override
    public boolean create(Pressure pressure, java.util.Date today) throws DBException {

        boolean isCreate = false;

        try {
            connection = DBConnectManager.getConnection();

            sql = "INSERT INTO T_HT_PRESSAO(cd_pressao, tm_hora, nr_sistolica_mm, nr_sistolica_hg) VALUES (SQ_PRESSAO.NEXTVAL, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setDate(1, (Date) today);
            stmt.setInt(2, pressure.getSistolica_mm());
            stmt.setInt(3, pressure.getSistolica_hg());

            stmt.executeUpdate();

            isCreate = true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar nova pressão");

        } catch (Exception ge){
            ge.printStackTrace();
            System.out.println("Mensagem do CREATE " + ge.getMessage());
        }
        finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isCreate;
    }

    /**
     * Busca no banco de dados a informação sobre a pressão arterial do usuário.
     *
     * @return: retorna uma lista com todas as pressões cadastradas
     */
    @Override
    public List<Pressure> getAll() {
        List<Pressure> pressureList = null;

        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_PRESSAO";

            stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                int code = rs.getInt("Código");
                Date data = rs.getDate("Data e Hora");
                int sis_mm = rs.getInt("Sistólica mm");
                int sis_hg = rs.getInt("Sistólica hg");

                Pressure pressure = new Pressure(sis_mm, sis_hg);

                pressureList.add(pressure);
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

        return pressureList;
    }

    /**
     * Salva no banco de dados a informação sobre a pressão arterial do usuário.
     *
     * @param: será necessário passar um objeto de pressão arterial e seu id.
     */
    @Override
    public void update(Pressure pressure) {
        try {
            connection = DBConnectManager.getConnection();

            sql = "UPDATE T_HT_PRESSAO SET tm_hora = ?,  nr_sistolica_mm = ?,  nr_sistolica_hg = ?, WHERE cd_pressao = ?";


            stmt = connection.prepareStatement(sql);

            stmt.setDate(1, (Date) pressure.getDate());
            stmt.setInt(2, pressure.getSistolica_mm());
            stmt.setInt(3, pressure.getSistolica_hg());
            stmt.setInt(4, pressure.getCode());

            stmt.executeUpdate();


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
    }

    /**
     * Deleta no banco de dados a informação sobre a pressão arterial do usuário.
     *
     * @param: será necessário passar o id da pressão arterial.
     */
    @Override
    public void delete(int code) {
        try {
            connection = DBConnectManager.getConnection();

            sql = "DELETE FROM T_HT_PRESSAO WHERE cd_pressao = ?";

            stmt = connection.prepareStatement(sql);

            stmt.setInt(1, code);
            stmt.executeUpdate();

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

    }
}

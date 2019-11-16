package model.DAO.impl;

import model.DAO.UserDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.BusinessPlan;
import model.entities_beans.EmergencyContact;
import model.entities_beans.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

public class OracleUserDAO implements UserDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;
    private ResultSet rs = null;

    /**
     * Salvar novo usuário no banco de dados. Acionado pelo botão Salvar nas páginas de Registro (pages/register_user.html)
     *
     * @param: objetos usuário
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    @Override
    public boolean create(User user, EmergencyContact ec) throws DBException {

        boolean isCreate = false;

        try {
            connection = DBConnectManager.getConnection();

            sql = "INSERT INTO T_HT_USER(cd_cpf, nm_nome, nm_sobrenome, dt_nascimento, ds_sexo, " +
                    "ds_email, nm_senha, vl_peso_inicial, vl_altura_inicial, vl_imc_inicial, nr_telefone, ds_plano)" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setLong(1, user.getCpf_id());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getLastName());
            java.sql.Date birthdayDate = new java.sql.Date(user.getBirthday().getTimeInMillis());
            stmt.setDate(4, birthdayDate);
            stmt.setString(5, String.valueOf(user.getGender()));
            stmt.setString(6, user.getEmail());
            stmt.setString(7, user.getPwd());
            stmt.setDouble(8, user.getInitWeight());
            stmt.setDouble(9, user.getInitHeight());
            stmt.setDouble(10, user.getInitIMC());
            stmt.setString(11, user.getPhone());
            stmt.setString(12, user.getType());

            stmt.executeUpdate();

            sql = "INSERT INTO T_HT_EMER(cd_contato, nm_nome, nm_sobrenome, ds_parente, " +
                    "ds_email, cd_cpf, nr_telefone)" +
                    "VALUES (SQ_CONT_EMER.NEXTVAL, ?, ?, ?, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, ec.getName());
            stmt.setString(2, ec.getLastName());
            stmt.setString(3, ec.getKinship());
            stmt.setString(4, ec.getEmail());
            stmt.setLong(5, ec.getCpf_id());
            stmt.setString(6, ec.getPhone());

            stmt.executeUpdate();

            isCreate = true;

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar novo usuário");
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

    /**
     * Gravar atualização do usuário no banco de dados. Acionado pelo botão Salvar na página Meus Dados (pages/my_account.html)
     *
     * @param: telefone, email e tipo de plano comercial do usuário
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    @Override
    public void update(User user) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = "UPDATE T_HT_USUARIO SET ds_email=? WHERE cd_cpf = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getEmail());
            stmt.setLong(2, user.getCpf_id());

            stmt.executeUpdate();


            sql = "UPDATE T_HT_TELEFONE SET nr_numero=? WHERE cd_cpf = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getPhone());
            stmt.setLong(2, user.getCpf_id());

            stmt.executeUpdate();


            sql = "UPDATE T_HT_PLAN_COMERCIAL SET nm_plano=? WHERE cd_cpf = ?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getType());
            stmt.setLong(2, user.getCpf_id());

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao atualizar");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    /**
     * deletar usuário e contato de emergência no banco de dados. Acionado pelo botão Deletar na página Meus Dados (pages/my_account.html)
     *
     * @param: identificador do usuário, email e senha para validação
     * @return: deve retornar um valor booleano notificando se os dados foram salvo ou não.
     */
    @Override
    public void delete(Long cpfId, String pwd) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = " DELETE FROM T_HT_USUARIO WHERE cd_cpf = ? AND pwd = ?";

            stmt = connection.prepareStatement(sql);

            stmt.setLong(1, cpfId);
            stmt.setString(2, pwd);

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao deletar usuário");
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
    public User read(String email, String pwd) throws DBException {
        User userRead = null;

        try {
            connection = DBConnectManager.getConnection();

            sql = "SELECT * FROM T_HT_USER WHERE ds_email = ? AND nm_senha = ?";

            stmt = connection.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, pwd);

            rs = stmt.executeQuery();

            if (rs.next()) {
                long idDb = rs.getLong("cd_cpf");
                String nameDb = rs.getString("nm_nome");
                String lastNameDb = rs.getString("nm_sobrenome");
                java.sql.Date dtBirthday = rs.getDate("dt_nascimento");
                Calendar btdDb = Calendar.getInstance();
                btdDb.setTimeInMillis(dtBirthday.getTime());
                char genderDb = rs.getString("ds_sexo").charAt(0);
                String emailDb = rs.getString("ds_email");
                String pwdDb = rs.getString("nm_senha");
                Double weightDb = rs.getDouble("vl_peso_inicial");
                Double heightDb = rs.getDouble("vl_altura_inicial");
                Double imcDb = rs.getDouble("vl_imc_inicial");
                String phoneDb = rs.getString("nr_telefone");
                String planDb = rs.getString("ds_plano");

                BusinessPlan bp = new BusinessPlan(planDb);

                userRead = new User(idDb, nameDb, lastNameDb, phoneDb, emailDb, btdDb, genderDb, pwdDb, weightDb, heightDb, bp);

            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new DBException("Erro ao cadastrar novo usuário");
        } finally {
            try {
                stmt.close();
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return userRead;
    }
}

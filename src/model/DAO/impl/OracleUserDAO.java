package model.DAO.impl;

import model.DAO.UserDAO;
import model.DBException.DBException;
import model.db_connection_singleton.DBConnectManager;
import model.entities_beans.EmergencyContact;
import model.entities_beans.User;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OracleUserDAO implements UserDAO {

    private Connection connection;
    private PreparedStatement stmt;
    private String sql;

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

            //TODO
            // - preciso entender como inserir o telefone do usuário pois está em outra table.  Entender como será feita as relações do banco
            // - preciso entender como inserir telefone do contato de emergencia pois está em outra table. Entender como será feita as relações do banco
            // - Preciso entender como inserir o plano comercial pois segue a mesma linha dos itens acima.
            sql = "INSERT INTO T_HT_USUARIO(cd_cpf, nm_nome, nm_sobrenome, dt_nascimento, ds_sexo, " +
                    "ds_email, nm_senha, vl_peso_inicial, vl_altura_inicial, vl_imc_inicial)" +
                    "VALUES (?, ?, ?, ?,?,?,?,?,?,?,?,?)";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, user.getCpf_id());
            stmt.setString(2, user.getName());
            stmt.setString(3, user.getLastName());
//            java.sql.Date birthday = new java.sql.Date(user.getBirthday().getTimeInMillis());
            stmt.setDate(4, (Date) user.getBirthday());
            stmt.setString(5, String.valueOf(user.getGender()));
            stmt.setString(6, user.getEmail());
            stmt.setString(7, user.getPwd());
            stmt.setDouble(8, user.getInitWeight());
            stmt.setDouble(9, user.getInitHeight());
            stmt.setDouble(10, user.getInitIMC());

            stmt.executeUpdate();


            sql = "INSERT INTO T_HT_CONT_EMERG(cd_contato, nm_nome, nm_sobrenome, ds_parente, " +
                    "ds_email)" +
                    "VALUES (SQ_T_HT_CONT_EMERG.NEXTVAL, ?, ?, ?, ?)";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, ec.getName());
            stmt.setString(2, ec.getLastName());
            stmt.setString(3, ec.getKinship());
            stmt.setString(4, ec.getEmail());

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

            sql = "UPDATE T_HT_USUARIO SET ds_email=?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getEmail());

            stmt.executeUpdate();


            sql = "UPDATE T_HT_TELEFONE SET nr_numero=?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getPhone());

            stmt.executeUpdate();


            sql = "UPDATE T_HT_PLAN_COMERCIAL SET nm_plano=?";
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, user.getType());

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
    public void delete(String cpfId, String pwd) throws DBException {
        try {
            connection = DBConnectManager.getConnection();

            sql = " DELETE FROM T_HT_USUARIO WHERE cd_cpf = ? AND pwd = ?";

            stmt = connection.prepareStatement(sql);

            stmt.setString(1, cpfId);
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
    public String auth(String email) throws DBException {
        return "ivanferrarimartini@yahoo.com.br";
    }
}

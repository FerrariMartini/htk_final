package model.db_connection_singleton;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnectManager {

    private static DBConnectManager dbConnectManager;

    private DBConnectManager() {
    }

    public static DBConnectManager getInstance() {
        if (dbConnectManager == null) {
            dbConnectManager = new DBConnectManager();
        }
        return dbConnectManager;
    }

    public static Connection getConnection() {

        Connection connection = null;

        try {
            //Registra o Driver, ou seja, o que está como parametro é o DRIVER do DB_ORACLE.
            Class.forName("oracle.jdbc.driver.OracleDriver");

            //Abre a conexão - a classe Connection é a interface do JDBC que representa a conexão com o DB. Passamos por parâmetro URL, LOGIN e SENHA de acesso.
            // a URL é definida pelo fabriante do SGDB.
            connection = DriverManager.getConnection("jdbc:oracle:thin:@oracle.fiap.com.br:1521:ORCL",
                    "RM81902", "120983");

            System.out.println("Conectado");


        } catch (ClassNotFoundException e) {
            System.out.println("O Drive JDBC não foi encontrado");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Não foi possível se conectar ao DB");
            e.printStackTrace();
        }
        return connection;
    }
}
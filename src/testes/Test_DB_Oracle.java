package testes;

import model.DAO.PressureDAO;
import model.DAO.impl.OracleUserDAO;
import model.DBException.DBException;
import model.entities_beans.BusinessPlan;
import model.entities_beans.Pressure;
import model.entities_beans.User;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Test_DB_Oracle {

    public static void main(String[] args) throws ParseException {

        SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy hh:MM:ss");
        PressureDAO pressureDAO = null;
        List<Pressure> _pressureList = pressureDAO.getAll();
        Pressure _pressure = null;
        int code;
        int _sistolica_mm;
        int _sistolica_hg;
        Date _date;

        // TESTES novo usuário usando FACTORY, DAO Interface, DBE Exception

        OracleUserDAO daoOracle = new OracleUserDAO();

        String id = "23242342342423424234";
        String firstName = "Ivan";
        String lastName = "Ferrari Martini";
        String phone = "(11) 95842-8900";
        String email = "ivanferrarimartiini@yahoo.com.br";
        Calendar birthday = Calendar.getInstance();
        char gender = 'M';
        String pwd = "Oi123#$@";
        double initWeight = 89.2f;
        double initHeight = 1.80f;
        BusinessPlan type = new BusinessPlan("premium");

        User newUser = new User(id, firstName, lastName, phone, email, birthday, gender, pwd, initWeight, initHeight, type);

//        try {
////            daoOracle.create(newUser);
//            System.out.println("Produto cadastrado.");
//
//        } catch (DBException e) {
//            e.printStackTrace();
//        }


        //CREATE - criando e salvando um objeto pressão no DB Oracle
        try {
            code = 1;
            _sistolica_mm = 120;
            _sistolica_hg = 90;
            _date = sfd.parse("12/09/2019 12:30:21");

            _pressure = new Pressure(code, _sistolica_mm, _sistolica_hg, _date);

            pressureDAO.create(_pressure);

        } catch (ParseException e) {
            e.getMessage();
        }


        //READ - Recuperando os dados do DB via query SELECT com o método getAll da classe OraclePressureDAO via interface PressureDAO e apresentando os dados.
        for (Pressure item : _pressureList) {
            System.out.println(item.getCode() + " " + item.getDate() + " " + item.getSistolica_mm() + "/" + item.getSistolica_hg() + "mmHg");
        }

        //UPDATE - Alterando dados no DB
        try {
            code = 1;
            _sistolica_mm = 160;
            _sistolica_hg = 96;
            _date = sfd.parse("30/10/2019 8:30:21");
            Pressure _pressureUpdate = new Pressure(code, _sistolica_mm, _sistolica_hg, _date);

            pressureDAO.update(_pressureUpdate);

        } catch (ParseException e) {
            e.printStackTrace();
        }

        //DELETE - Deletando o dado do DB.
        pressureDAO.delete(_pressure.getCode());

    }
}

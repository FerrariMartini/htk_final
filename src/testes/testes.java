package testes;

import factory.DAOFactory;
import model.DAO.GoalsDAO;
import model.DAO.UserDAO;
import model.DBException.DBException;
import model.entities_beans.Goals;
import model.entities_beans.User;

import java.text.SimpleDateFormat;
import java.util.List;

public class testes {

    public static void main(String[] args) {

        SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");

        try {

            UserDAO dao = DAOFactory.getUserDAO();

            GoalsDAO dag = DAOFactory.getGoalsDAO();

            List<Goals> goallist = dag.readGoals(22566738807l);

            System.out.println(goallist.get(0).getQtdGoal());


            String eamil = "ivanferrarimartini@gmail.com";
            String pwd = "Ap426900";

            User newUser = dao.read(eamil, pwd);

//            System.out.println("TO INSTANT" + sfd.format(newUser.getBirthday().toInstant()));
            System.out.println("TO getTime" + sfd.format(newUser.getBirthday().getTime()));


//            Date newDate = new Date();
//
//            System.out.println(newDate);
//
//            String dt = sfd.format(newDate);
//
//            System.out.println(dt);
//
//            Calendar d = Calendar.getInstance();
//            d.setTime(sfd.parse(dt));
//
//            System.out.println(d);
//
//
//            String pwdFront = "Ap420069";
//
//            pwdFront = CriptografiaUtil.criptografar(pwdFront);
//
//            System.out.println(pwdFront);
//
//            String pwdDBCript = "e0283c25bcfaaaf1659aefdf80c97f1d";
//
//            String pwdFront2 = CriptografiaUtil.criptografar(pwdFront);
//
//            System.out.println(pwdFront2);


//            String data = "12-09-1983";
//
//            Date hoje = sfd.parse(data);
//
//            System.out.println(hoje);
//
//


//
//
//            String id = "22566738807";
//
//            Long id2 = Long.parseLong(id);
//
//            System.out.println(id2);
//
//
//            Locale lcBRL = new Locale("pt", "BR");
//            Locale lcUS = new Locale("en", "US");
//
//            NumberFormat fBRL = NumberFormat.getInstance(lcBRL);
//            NumberFormat fUS = NumberFormat.getInstance(lcUS);
//
//            //recebendo a string do frontend
//            String brl2 = "2.322,10";
//
//            // converte uma string no formato brasileiro para um number no formato US
//            Number brl3 = fBRL.parse(brl2);
//
//            // converte em Double o Number
//            Double brl4 = (Double) brl3;
//
//            System.out.println("BRL3" + " " + brl3);
//            System.out.println("BRL3" + " " + brl3);
//
//            if (brl3 instanceof Double) {
//                System.out.println("é um double");

        } catch (DBException ex) {
            ex.printStackTrace();
        }

    }
}


//            brl2 = brl2.replace(",", ";");
//            brl2 = brl2.replace(".", "");
//            brl2 = brl2.replace(";", ".");


//            System.out.println(brl2);
package testes;//package application;
//
//import model.db_connection_singleton.DAO.BusinessPlanDAO;
//import model.db_connection_singleton.DAO.OraclePressureDAO;
//import entities.*;
//
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.List;
//import java.util.Scanner;
//
//public class TestProgram {
//
//    public static void main(String[] args) throws ParseException {
//
//        SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");
//        Scanner sc = new Scanner(System.in);
//
//
//        // essas variáveis devem receber os dados vindos dos formulários Bootstrap.
//        int id = 01;
//        String firstName = "Ivan";
//        String lastName = "Ferrari Martini";
//        String phone = "(11) 95842-8900";
//        String email = "ivanferrarimartiini@yahoo.com.br";
//        Date birthday = sfd.parse("12/09/1983");
//        char gender = 'M';
//        String pwd = "Oi123#$@";
//        double initWeight = 89.2f;
//        double initHeight = 1.80f;
//        BusinessPlan type = new BusinessPlan("premium");
//
//
//        User newUser = new User(id, firstName, lastName, phone, email, birthday, gender, pwd, initWeight, initHeight, type);
//
//        System.out.println(newUser.toString());
//
//        System.out.println();
//
//        // essas variáveis devem receber os dados vindos dos formulários Bootstrap.
//        String kinship = "Filho";
//
//        // o construtor deve construir o objeto e que será passando depois para os métodos de Salvar
//        EmergencyContact newEmC = new EmergencyContact(id, firstName, lastName, phone, email, kinship);
//
//        System.out.println(newEmC.toString());
//
//        // instanciando um novo peso:
//        Date today = new Date();
//        Weight newWeight = new Weight(83.0, today);
//
//        // testar o calculo do IMC atual;
//        double currentImc = newWeight.currentImc(newUser.getInitHeight());
//
//        System.out.printf("O IMC Atual é: %s", String.format("%.2f", currentImc));
//
//        System.out.println();
//        System.out.println();
//
//        //Atividade do Capitulo 3 - fase 5 - Teste de lista de objetos e model.db_connection_singleton.DAO.
//
//        List<Pressure> _pressureList = new OraclePressureDAO().getAll();
//
//        for (Pressure p : _pressureList) {
//            System.out.println("No dia: " + p.getDate() + " a pressão foi: " + p.getPressure() + "mm/Hg");
//        }
//
//        List<BusinessPlan> _businessPlanList = new BusinessPlanDAO().getAll();
//
//        for (BusinessPlan bsp : _businessPlanList) {
//            System.out.println(bsp.getType());
//        }
//
//        sc.close();
//    }
//}
//
//

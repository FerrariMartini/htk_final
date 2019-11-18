package controller;

import factory.DAOFactory;
import model.DAO.EatHabitsDAO;
import model.entities_beans.EatHabits;
import model.entities_beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@WebServlet("/Alimentos")
public class FoodServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private EatHabitsDAO daoFood;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");

    public void init() {
        daoFood = DAOFactory.getEatHabitsDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String dateToday = req.getParameter("dateToday");
        String meal = req.getParameter("typeFood");

        switch (meal) {
            case "coffeeBrk":
                cfb(meal, dateToday, req, resp);
                break;

            case "snack":
                snack(meal, dateToday, req, resp);
                break;


            case "lunch":
                lunch(meal, dateToday, req, resp);
                break;

            case "tea":
                tea(meal, dateToday, req, resp);
                break;

            case "dinner":
                dinner(meal, dateToday, req, resp);
                break;

            case "ceia":
                ceia(meal, dateToday, req, resp);
                break;

        }
    }

    private void ceia(String meal, String dateToday, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String food = req.getParameter("my_ceia");
            float porcao = Float.parseFloat(req.getParameter("porcaoCeia"));
            float qtd = Float.parseFloat(req.getParameter("qtdCeia"));
            float calories = Float.parseFloat(req.getParameter("caloriesCeia"));

            foodServiceDAO(meal, req, resp, food, porcao, qtd, calories, dateToday);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }

    private void dinner(String option, String dateToday, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String food = req.getParameter("my_dinner");
            float porcao = Float.parseFloat(req.getParameter("porcaoDnr"));
            float qtd = Float.parseFloat(req.getParameter("qtdDnr"));
            float calories = Float.parseFloat(req.getParameter("caloriesDnr"));

            foodServiceDAO(option, req, resp, food, porcao, qtd, calories, dateToday);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }


    private void tea(String option, String dateToday, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String food = req.getParameter("my_tea");
            float porcao = Float.parseFloat(req.getParameter("porcaoTea"));
            float qtd = Float.parseFloat(req.getParameter("qtdTea"));
            float calories = Float.parseFloat(req.getParameter("caloriesTea"));

            foodServiceDAO(option, req, resp, food, porcao, qtd, calories, dateToday);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }

    private void lunch(String option, String dateToday, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String food = req.getParameter("my_lunch");
            float porcao = Float.parseFloat(req.getParameter("porcaoLhc"));
            float qtd = Float.parseFloat(req.getParameter("qtdLhc"));
            float calories = Float.parseFloat(req.getParameter("caloriesLhc"));

            foodServiceDAO(option, req, resp, food, porcao, qtd, calories, dateToday);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }

    private void snack(String option, String dateToday, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String food = req.getParameter("snack_time");
            float porcao = Float.parseFloat(req.getParameter("porcaoSk"));
            float qtd = Float.parseFloat(req.getParameter("qtdSk"));
            float calories = Float.parseFloat(req.getParameter("caloriesSk"));

            foodServiceDAO(option, req, resp, food, porcao, qtd, calories, dateToday);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }

    private void cfb(String option, String dateToday, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String food = req.getParameter("coffe_brk");
            float porcao = Float.parseFloat(req.getParameter("porcaoBkf"));
            float qtd = Float.parseFloat(req.getParameter("qtdBkf"));
            float calories = Float.parseFloat(req.getParameter("caloriesBkf"));

            foodServiceDAO(option, req, resp, food, porcao, qtd, calories, dateToday);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);

    }


    private void foodServiceDAO(String option, HttpServletRequest req, HttpServletResponse resp, String food, float porcao, float qtd, float calories, String dateToday) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");

            if (dateToday == null) {
                req.setAttribute("err", "É necessário informar a data de hoje.");
            } else {
                Calendar dt = Calendar.getInstance();
                dt.setTime(sfd.parse(dateToday));

                EatHabits newFood = new EatHabits(0, option, food, qtd, porcao, calories, dt);
                boolean sucess = daoFood.create(newFood, loggedUser.getCpf_id());

                if (sucess) {
                    System.out.println("sucessso  > TRUE");
                    req.setAttribute("sucess", "Sua refeição foi cadastrada com sucesso :)");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
    }
}

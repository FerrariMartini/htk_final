package controller;

import factory.DAOFactory;
import model.DAO.WeightTodayDAO;
import model.entities_beans.User;
import model.entities_beans.WeightToday;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;

@WebServlet("/CadastraPeso")
public class WeightTodayServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private WeightTodayDAO daoWeight;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");


    public void init() {
        daoWeight = DAOFactory.getWeightTodayDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");

            String dateToday = req.getParameter("dateToday");

            System.out.println("dia de hoje é " + dateToday);

            java.sql.Date dt = new java.sql.Date(sfd.parse(dateToday).getTime());

            double weightToday = Double.parseDouble(req.getParameter("weightToday").replace(",", "."));

            System.out.println("dia de hoje é " + dateToday);
            System.out.println("peso de hoje é " + weightToday);

            WeightToday newWeightToday = new WeightToday(weightToday, dt, currentImc(loggedUser.getInitHeight(), weightToday));

            boolean sucess = daoWeight.create(newWeightToday);

            if (sucess) {
                req.setAttribute("sucess", "Peso salvo! Continue o preenchimento");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Deu merda no WeightTodayServlet " + e.getMessage());
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }

        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }

    private double currentImc(double initHeight, double weightDay) {
        return weightDay / (initHeight * initHeight);
    }

}
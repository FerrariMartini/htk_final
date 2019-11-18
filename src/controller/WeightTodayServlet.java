package controller;

import factory.DAOFactory;
import model.DAO.WeightTodayDAO;
import model.entities_beans.User;
import model.entities_beans.WeightToday;
import model.service.ImcCaculation;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
            req.setAttribute("uName", loggedUser.getName());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Deu merda no WeightTodayServlet " + e.getMessage());
        }

        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");

            String dateToday = req.getParameter("dateToday");
            Calendar dt = Calendar.getInstance();
            dt.setTime(sfd.parse(dateToday));


            double weightToday = Double.parseDouble(req.getParameter("weightToday").replace(",", "."));

            System.out.println("dia de hoje é " + dateToday);
            System.out.println("peso de hoje é " + weightToday);

            WeightToday newWeightToday = new WeightToday(0, weightToday, dt, ImcCaculation.evaluateImc(weightToday, loggedUser.getInitHeight()));
//            WeightToday newWeightToday = new WeightToday(0, weightToday, dt, ImcCaculation.evaluateImc(1.78, weightToday));


            boolean sucess = daoWeight.create(newWeightToday, loggedUser.getCpf_id());

            if (sucess) {
                req.setAttribute("sucess", "Peso salvo! Continue o preenchimento");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Deu merda no WeightTodayServlet " + e.getMessage());
            req.setAttribute("err", "Não encontrei os dados :(");
        }

        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }
}
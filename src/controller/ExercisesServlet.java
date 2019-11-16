package controller;

import factory.DAOFactory;
import model.DAO.ExercisesDAO;
import model.entities_beans.Exercises;
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


@WebServlet("/Exercicios")
public class ExercisesServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ExercisesDAO daoExe;
    private boolean sucess = false;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");
    private SimpleDateFormat sfd2 = new SimpleDateFormat("dd/MM/yyyy HH:MM:ss");

    public void init() {
        daoExe = DAOFactory.getExercisesDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");

            String dateToday = req.getParameter("dateToday");
            Calendar dt = Calendar.getInstance();
            dt.setTime(sfd.parse(dateToday));

            String exerType = req.getParameter("exercise");

            String time = req.getParameter("time");
            Calendar tm = Calendar.getInstance();
            tm.setTime(sfd2.parse(time));

            float exerCalories = Float.parseFloat(req.getParameter("exer_calories"));

            System.out.println("tipo " + exerType);
            System.out.println("tempo " + time);
            System.out.println("calorias " + exerCalories);
            System.out.println("dia " + dt);

            if (dateToday == null) {
                req.setAttribute("err", "É necessário informar a data de hoje.");
            } else {
                Exercises newExercise = new Exercises(0, exerType, tm, exerCalories, dt);
                sucess = daoExe.create(newExercise, loggedUser.getCpf_id());
            }

            if (sucess) {
                System.out.println("sucessso  > TRUE");
                req.setAttribute("sucess", "Exercicios cadastrados com sucesso");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }


}

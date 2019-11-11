package controller;

import factory.DAOFactory;
import model.DAO.GoalsDAO;
import model.DBException.DBException;
import model.entities_beans.Goals;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.Locale;

@WebServlet("/Metas")
public class GoalsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private GoalsDAO dao;


    public void init() throws ServletException {
        dao = DAOFactory.getGoalsDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NullPointerException {
        boolean sucess = false;
        try {

            Locale lcBRL = new Locale("pt", "BR");
            Locale lcUS = new Locale("en", "US");

            NumberFormat fBRL = NumberFormat.getInstance(lcBRL);
            NumberFormat fUS = NumberFormat.getInstance(lcUS);


            Double exerciseGoal = (Double) fBRL.parse(req.getParameter("e"));
            Double mealsGoal = (Double) fBRL.parse(req.getParameter("m"));
            Double hydraGoals = (Double) fBRL.parse(req.getParameter("h"));
            Double weightGoal = (Double) fBRL.parse(req.getParameter("w"));

            System.out.println(exerciseGoal);
            System.out.println(mealsGoal);
            System.out.println(hydraGoals);
            System.out.println(weightGoal);

            Goals newGoals = new Goals(weightGoal, hydraGoals, exerciseGoal, mealsGoal);

            sucess = dao.create(newGoals);

            if (sucess) {
                req.setAttribute("sucess", "Metas cadastradas com sucesso!");
                req.getRequestDispatcher("goals.jsp").forward(req, resp);
            } else {
                req.setAttribute("err", "Banco de dados indisponível");
                req.getRequestDispatcher("goals.jsp").forward(req, resp);
            }

        } catch (NullPointerException | ParseException | ClassCastException e) {
            e.printStackTrace();
            req.setAttribute("err", "Você precisa inserir valores decimais. Ex: 4,5");
            req.getRequestDispatcher("goals.jsp").forward(req, resp);
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("err", "Banco de dados indisponível");
            req.getRequestDispatcher("goals.jsp").forward(req, resp);
        }

    }
}

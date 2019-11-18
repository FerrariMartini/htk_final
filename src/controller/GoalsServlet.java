package controller;

import factory.DAOFactory;
import model.DAO.GoalsDAO;
import model.DBException.DBException;
import model.entities_beans.Goals;
import model.entities_beans.TypeGoals;
import model.entities_beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet("/Metas")
public class GoalsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private GoalsDAO dao;


    public void init() throws ServletException {
        dao = DAOFactory.getGoalsDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NullPointerException {

        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");
            long cpf_id = loggedUser.getCpf_id();

            Locale lcBRL = new Locale("pt", "BR");
            Locale lcUS = new Locale("en", "US");

            NumberFormat fBRL = NumberFormat.getInstance(lcBRL);

            double exerciseGoal = (Double) fBRL.parse(req.getParameter("eg"));
            double mealGoal = (Double) fBRL.parse(req.getParameter("mg"));
            double hydraGoal = (Double) fBRL.parse(req.getParameter("hg"));
            double weightGoal = (Double) fBRL.parse(req.getParameter("wg"));

            List<Goals> objGoalsList = new ArrayList<>();

            Goals exGoal = new Goals(0, TypeGoals.ATIVIDADE_FISICA.toString(), exerciseGoal);
            objGoalsList.add(exGoal);
            Goals mGoal = new Goals(0, TypeGoals.HABITO_ALIMENTAR.toString(), mealGoal);
            objGoalsList.add(mGoal);
            Goals hGoal = new Goals(0, TypeGoals.NIVEL_HIDRATACAO.toString(), hydraGoal);
            objGoalsList.add(hGoal);
            Goals wGoal = new Goals(0, TypeGoals.PESO_IDEAL.toString(), weightGoal);
            objGoalsList.add(wGoal);

            for (Goals goals : objGoalsList) {
                boolean sucess = dao.create(goals, cpf_id);

                if (sucess) {
                    req.setAttribute("sucess", "Metas cadastradas com sucesso!");
                }
            }

        } catch (NullPointerException | ParseException | ClassCastException e) {
            e.printStackTrace();
            req.setAttribute("err", "Você precisa inserir valores decimais. Ex: 4,5");
        } catch (DBException db) {
            db.printStackTrace();
            req.setAttribute("err", "Banco de dados indisponível");
        }
        req.getRequestDispatcher("goals.jsp").forward(req, resp);
    }
}

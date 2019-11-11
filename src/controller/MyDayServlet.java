package controller;

import factory.DAOFactory;
import model.DAO.TodayDAO;
import model.DBException.DBException;
import model.entities_beans.Today;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/CadastrarDia")
public class MyDayServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private TodayDAO dao;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");


    public void init() throws ServletException {
        dao = DAOFactory.getTodayDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean sucess = false;

        try {
            Date today = sfd.parse(req.getParameter("today"));
            Double weightToday = Double.parseDouble(req.getParameter("weightToday").replace(",", "."));

            String ex = req.getParameter("exList");
            String time = req.getParameter("time");
            String cl = req.getParameter("caloriesExercises");

            String bk = req.getParameter("breakfast_list");
            String pc = req.getParameter("porcao");
            String qtd = req.getParameter("qtd");
            String caloriesBkf = req.getParameter("caloriesBkf");

            System.out.println(today);
            System.out.println(weightToday);

            System.out.println(ex);
            System.out.println(time);
            System.out.println(cl);
            System.out.println(bk);
            System.out.println(pc);
            System.out.println(qtd);
            System.out.println(caloriesBkf);

            Today newToday = new Today(weightToday, today);

            sucess = dao.create(newToday);

            if (sucess) {
                req.setAttribute("sucess", "Dia e Peso salvos! Continue ");
                System.out.println("Cadastrado com sucesso");
            } else {
                System.out.println("Deu merda no DB");
            }

        } catch (ParseException | NullPointerException | DBException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}

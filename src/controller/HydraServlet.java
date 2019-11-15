package controller;

import factory.DAOFactory;
import model.DAO.HydrationDAO;
import model.entities_beans.Hydration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Hidratar")
public class HydraServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private HydrationDAO daoHydra;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");


    public void init() {
        daoHydra = DAOFactory.getHydraDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            String dateToday = req.getParameter("dateToday");

            System.out.println("dia de hoje é " + dateToday);

            java.sql.Date dt = new java.sql.Date(sfd.parse(dateToday).getTime());

            String hydraOption = req.getParameter("hydra_option");
            String unitHydra = req.getParameter("unit_hydra");
            String qtdHydra = req.getParameter("qtd_hydra");

            System.out.println(hydraOption);
            System.out.println(qtdHydra);
            System.out.println(unitHydra);
            System.out.println(dt);

            Float qtd = Float.parseFloat(qtdHydra);

            System.out.println(qtd);


            if (dateToday == null) {
                req.setAttribute("err", "É necessário informar a data de hoje.");
            }

            Hydration newHydra = new Hydration();

            boolean sucess = daoHydra.create(newHydra);

            if (sucess) {
                req.setAttribute("sucess", "Hidratação cadastradas com sucesso");
            } else {
                req.setAttribute("err", "Deu merda no DB");
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("Alguma merda EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }
}

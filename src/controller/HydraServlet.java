package controller;

import factory.DAOFactory;
import model.DAO.HydrationDAO;
import model.entities_beans.Hydration;
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

        //TODO - montar um Script para calcular a quantidade da água automaticamente
        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");

            String dateToday = req.getParameter("dateToday");
            Calendar dt = Calendar.getInstance();
            dt.setTime(sfd.parse(dateToday));

            String hydraOption = req.getParameter("hydra_option");

            String unitHydra = req.getParameter("unit_hydra");
            float unit = Float.parseFloat(unitHydra);

            String qtdHydra = req.getParameter("qtd_hydra");
            float qtd = Float.parseFloat(qtdHydra);

            System.out.println(qtd);


            if (dateToday == null) {
                req.setAttribute("err", "É necessário informar a data de hoje.");
            }

            Hydration newHydra = new Hydration(0, dt, hydraOption, unit, qtd);

            boolean sucess = daoHydra.create(newHydra, loggedUser.getCpf_id());

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

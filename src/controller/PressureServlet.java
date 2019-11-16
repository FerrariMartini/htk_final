package controller;

import factory.DAOFactory;
import model.DAO.PressureDAO;
import model.DBException.DBException;
import model.entities_beans.Pressure;
import model.entities_beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

@WebServlet("/Pressao")
public class PressureServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private PressureDAO daoPressure;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");

    public void init() {
        daoPressure = DAOFactory.getPressureDAO();
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");
            String dateToday = req.getParameter("dateToday");
            Calendar dt = Calendar.getInstance();
            dt.setTime(sfd.parse(dateToday));

            String bloodPressure = req.getParameter("blood_pressure");

            System.out.println(bloodPressure);
            System.out.println(dateToday);

            String[] bp = bloodPressure.split("/");

            int mmPressure = Integer.parseInt(bp[0]);
            int hgPressure = Integer.parseInt(bp[1]);

            System.out.println(mmPressure);
            System.out.println(hgPressure);

            if (dateToday == null) {
                req.setAttribute("err", "É necessário informar a data de hoje.");
            } else {
                Pressure newPressure = new Pressure(0, mmPressure, hgPressure, dt);
                boolean sucess = daoPressure.create(newPressure, loggedUser.getCpf_id().toString());

                if (sucess) {
                    req.setAttribute("sucess", "Pressão cadastrada com sucesso :)");
                }
            }

        } catch (DBException | ParseException db) {
            db.printStackTrace();
            System.out.println(db.getMessage());
            System.out.println("Alguma merda EXCEPTION");
            req.setAttribute("err", "Deu merda no DB PQ É FALSE");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
        req.getRequestDispatcher("my_day_page.jsp").forward(req, resp);
    }
}

package controller;

import factory.DAOFactory;
import model.DAO.EmContDAO;
import model.DAO.UserDAO;
import model.entities_beans.EmergencyContact;
import model.entities_beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/MinhaConta")
public class MyAccountServlet extends HttpServlet {

    private UserDAO daoUser;
    private EmContDAO daoEc;

    @Override
    public void init() throws ServletException {
        super.init();
        daoUser = DAOFactory.getUserDAO();
        daoEc = DAOFactory.getECDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            HttpSession session = req.getSession();
            User loggedUser = (User) session.getAttribute("user");
            EmergencyContact ec = (EmergencyContact) session.getAttribute("ec");

            long userId = loggedUser.getCpf_id();

            String option = req.getParameter("formOption");

            switch (option) {
                case "ecForm":
                    ef(req, resp, userId, ec);
                    break;

                case "userForm":
                    uf(req, resp, userId);
                    break;


                case "pwdForm":
                    pf(req, resp, userId);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
            req.getRequestDispatcher("erro404.jsp").forward(req, resp);
        }
    }

    private void ef(HttpServletRequest req, HttpServletResponse resp, Long cpf_id, EmergencyContact ec) throws ServletException, IOException {
        try {
            String ecName = req.getParameter("ecName");
            String ecLastName = req.getParameter("ecLastName");
            String ecKinship = req.getParameter("eckinship");
            String ecPhone = req.getParameter("ecPhone");
            String ecEmail = req.getParameter("ecEmail");

            System.out.println(ecName);
            System.out.println(ecLastName);
            System.out.println(ecKinship);
            System.out.println(ecPhone);
            System.out.println(ecEmail);

            daoEc.update(new EmergencyContact(ec.getCode(), ecName, ecLastName, ecPhone, ecEmail, ecKinship, cpf_id));

            req.setAttribute("sucess", "Atualização Realizada &#128521;");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
        }
        req.getRequestDispatcher("my_account.jsp").forward(req, resp);
    }

    private void uf(HttpServletRequest req, HttpServletResponse resp, Long cpf_id) throws ServletException, IOException {
        try {
            String userPhone = req.getParameter("userPhone");
            String userEmail = req.getParameter("userEmail");
            String userPlan = req.getParameter("priceType");

            System.out.println(userPhone);
            System.out.println(userEmail);
            System.out.println(userPlan);

            daoUser.update(userEmail, userPhone, userPlan, cpf_id);

            req.setAttribute("sucess", "Atualização Realizada &#128521;");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
        }
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }

    private void pf(HttpServletRequest req, HttpServletResponse resp, Long cpf_id) throws ServletException, IOException {
        try {
            String userPwd = req.getParameter("newUserPWD");
            System.out.println(userPwd);

            daoUser.upPwd(userPwd, cpf_id);

            req.setAttribute("sucess", "Atualização Realizada &#128521;");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
            System.out.println("EXCEPTION - deu alguma merda &#128533;");
            req.setAttribute("err", "Alguma merda - EXCEPTION");
        }
        req.getRequestDispatcher("my_account.jsp").forward(req, resp);
    }
}








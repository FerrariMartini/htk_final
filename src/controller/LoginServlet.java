package controller;

import factory.DAOFactory;
import model.DAO.UserDAO;
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

@WebServlet("/Logar")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");

    private UserDAO dao;

    public void init() throws ServletException {
        dao = DAOFactory.getUserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            //Dados do request recuperados do frontend
            String email = request.getParameter("login");
            String pwd = request.getParameter("pwd");

            //Recupera USER do DB pela validacao do email
            User loggedUser = dao.read(email, pwd);

            //Dados da query do DB via DAO
            String loginDAO = loggedUser.getEmail();
            String pwdDAO = loggedUser.getPwd();

            if (email.equals(loginDAO) && pwd.equals(pwdDAO)) {
                HttpSession session = request.getSession();
                session.setAttribute("user", loggedUser);

                Date todayD = new Date();
                String todayS = sfd.format(todayD);
                Calendar todayC = Calendar.getInstance();
                todayC.setTime(sfd.parse(todayS));
                session.setAttribute("dateToday", todayC);

                response.sendRedirect("Dashboard");

            } else {
                request.setAttribute("err", "Login ou Senha inválidos. Verifique e tente novamente");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception db) {
            db.printStackTrace();
            request.setAttribute("err", "Verifique sua conexão de internet ou tente novamente");
            request.getRequestDispatcher("login.jsp").forward(request, response);

        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.invalidate();

        System.out.println("Terminou a sessão de usuário");

        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
}

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

@WebServlet("/Logar")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

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
                response.sendRedirect("dashboard.jsp");
                HttpSession session = request.getSession();
                session.setAttribute("user", loggedUser);

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
}

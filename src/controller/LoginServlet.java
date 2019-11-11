package controller;

import factory.DAOFactory;
import model.DAO.UserDAO;
import model.DBException.DBException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
            String login = request.getParameter("login");
            String pwd = request.getParameter("pwd");

            //Dados da query do DB via DAO
            String loginDAO = dao.auth(login);
            String pwdDAO = "Ap420069";

            if (login.equals(loginDAO) && pwd.equals(pwdDAO)) {
                response.sendRedirect("dashboard.jsp");
            } else {
                request.setAttribute("err", "Login ou Senha inválidos. Verifique e tente novamente");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (DBException | IOException db) {
            db.printStackTrace();
        }
    }
}

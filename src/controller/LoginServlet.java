package controller;

import factory.DAOFactory;
import model.DAO.UserDAO;

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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //Dados do request recuperados do frontend
        String login = request.getParameter("login");
        String pwd = request.getParameter("pwd");

        //Dados da query do DB via DAO
        String loginDAO = "ivanferrarimartini@yahoo.com.br";
        String pwdDAO = "Ap420069";


        if (login.equals(loginDAO) && pwd.equals(pwdDAO)) {

            response.sendRedirect("dashboard.jsp");

        } else {
            request.getRequestDispatcher("deny.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}

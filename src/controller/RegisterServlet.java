package controller;


import factory.DAOFactory;
import model.DAO.UserDAO;
import model.DBException.DBException;
import model.entities_beans.BusinessPlan;
import model.entities_beans.EmergencyContact;
import model.entities_beans.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/Cadastrar")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");

    private UserDAO dao;


    public void init() throws ServletException {
        dao = DAOFactory.getUserDAO();
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, NullPointerException {
        boolean sucess = false;

        try {
            String id_cpf = req.getParameter("cpf");
            String firstName = req.getParameter("name");
            String lastName = req.getParameter("lastName");
            String phone = req.getParameter("phone");
            String email = req.getParameter("email");
            Date birthday = sfd.parse(req.getParameter("birthday"));
            char gender = req.getParameter("gender").charAt(0);
            String pwd = req.getParameter("pwd");
            BusinessPlan type = new BusinessPlan(req.getParameter("priceType"));
            Double initWeight = Double.parseDouble(req.getParameter("weight").replace(",", "."));
            Double initHeight = Double.parseDouble(req.getParameter("height").replace(",", "."));

            User newUser = new User(id_cpf, firstName, lastName, phone, email, birthday, gender, pwd, initWeight, initHeight, type);

            String emName = req.getParameter("emName");
            String emLastName = req.getParameter("emLastName");
            String emPhone = req.getParameter("emPhone");
            String emEmail = req.getParameter("emEmail");
            String emkinship = req.getParameter("kinship");

            EmergencyContact newEmeContact = new EmergencyContact(newUser.getCpf_id(), emName, emLastName, emPhone, emEmail, emkinship);

            System.out.println(newUser.toString());
            System.out.println(newEmeContact.toString());

            sucess = dao.create(newUser, newEmeContact);

            if (sucess) {
                resp.sendRedirect("login.jsp");
            } else {
                req.setAttribute("err", "Esse usuário já está cadastrado. Recupere seu login e senha no botão abaixo");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }

        } catch (NullPointerException | ParseException | DBException e) {
            e.printStackTrace();
        }
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket;

import com.travelticket.dbutill.User;
import com.travelticket.dbutill.UserDbUtill;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author fatur
 */
public class HomeTravel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        RequestDispatcher dispatcher;
        String url = request.getParameter("page");

        try {
            switch (url) {
                case "signup":
                    dispatcher = request.getRequestDispatcher("signup.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "gagal_daftar":
                    out.println("<script type=text/javascript>"
                            + "alert('Username atau email sudah ada !');");
                    out.println("</script>");
                    dispatcher = request.getRequestDispatcher("signup.jsp");
                    dispatcher.include(request, response);
                    break;
                case "gagal_login":
                    out.println("<script type=text/javascript>"
                            + "alert('Password atau Username salah !');");
                    out.println("</script>");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.include(request, response);
                    break;
            }
        } catch (NullPointerException e) {
            dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        RequestDispatcher dispatcher;

        if (action.equals("register")) {
            try {
                String id = UUID.randomUUID().toString();

                User user = new User();
                user.setIdUser(id);
                user.setNameUser(request.getParameter("name"));
                user.setEmail(request.getParameter("email"));
                user.setUsername(request.getParameter("username"));
                user.setPassword(request.getParameter("pass"));

                UserDbUtill.insertUserData(user);
                response.sendRedirect("HomeTravel");

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(HomeTravel.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {

                String username = request.getParameter("username");
                String password = request.getParameter("pass");
                User user = UserDbUtill.getUserData(username);

                if (user != null) {
                    if (password.equals(user.getPassword())) {
                        HttpSession session = request.getSession();
                        session.setAttribute("loginData", user);
                        response.sendRedirect("TravelTicket");
                    } else {
                        response.sendRedirect("HomeTravel?page=gagal_login");
                    }
                } else {
                    response.sendRedirect("HomeTravel?page=gagal_login");
                }

            } catch (NullPointerException | ClassNotFoundException | SQLException e) {
                response.sendRedirect("HomeTravel?page=gagal_login");
            }
        }
    }
}

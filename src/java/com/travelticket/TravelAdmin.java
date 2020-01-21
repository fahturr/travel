/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket;

import com.travelticket.dbutill.Perusahaan;
import com.travelticket.dbutill.PerusahaanDbUtill;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class TravelAdmin extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        RequestDispatcher dispatcher;
        String url = request.getParameter("page");

        try {
            switch (url) {
                case "signup":
                    dispatcher = request.getRequestDispatcher("signup_admin.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "gagal_daftar":
                    out.println("<script type=text/javascript>"
                            + "alert('Username atau email sudah ada !');");
                    out.println("</script>");
                    dispatcher = request.getRequestDispatcher("signup_admin.jsp");
                    dispatcher.include(request, response);
                    break;
                case "gagal_login":
                    out.println("<script type=text/javascript>"
                            + "alert('Password atau Username salah !');");
                    out.println("</script>");
                    dispatcher = request.getRequestDispatcher("login_admin.jsp");
                    dispatcher.include(request, response);
                    break;
            }
        } catch (NullPointerException e) {
            dispatcher = request.getRequestDispatcher("login_admin.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("register")) {
            try {

                Perusahaan perusahaan = new Perusahaan();

                perusahaan.setNamaPerusahaan(request.getParameter("name"));
                perusahaan.setUsernamePerusahaan(request.getParameter("username"));
                perusahaan.setPasswordPerusahaan(request.getParameter("pass"));

                PerusahaanDbUtill.insertUserData(perusahaan);
                response.sendRedirect("TravelAdmin");

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(TravelAdmin.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                String username = request.getParameter("username");
                String password = request.getParameter("pass");
                Perusahaan perusahaan = PerusahaanDbUtill.getPerusahaanData(username);

                System.out.println(perusahaan.getNamaPerusahaan());

                if (perusahaan != null) {
                    if (password.equals(perusahaan.getPasswordPerusahaan())) {
                        HttpSession session = request.getSession();
                        session.setAttribute("loginData", perusahaan);
                        response.sendRedirect("Admin");
                    } else {
                        response.sendRedirect("TravelAdmin?page=gagal_login");
                    }
                } else {
                    response.sendRedirect("TravelAdmin?page=gagal_login");
                }

            } catch (NullPointerException | ClassNotFoundException | SQLException e) {
                response.sendRedirect("TravelAdmin?page=gagal_login");
            }
        }
    }
}

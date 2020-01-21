/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket;

import com.travelticket.dbutill.Ticket;
import com.travelticket.dbutill.TicketDbUtill;
import com.travelticket.dbutill.TransaksiDbUtill;
import com.travelticket.dbutill.User;
import java.io.IOException;
import java.io.PrintWriter;
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
public class TravelTicket extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get the data from model
//        String tickets[] = {"payakumbuh", "tembilahan", "padang"};
//        String nama = "Fahtur";
//        request.setAttribute("tickets", tickets);
//        request.setAttribute("single", nama);
        PrintWriter out = response.getWriter();
        RequestDispatcher dispatcher;

        String action = request.getParameter("action");

        try {
            switch (action) {
                case "logout":
                    HttpSession session = request.getSession();
                    session.invalidate();
                    response.sendRedirect("TravelTicket");
                    break;
                case "berhasil":
                    out.println("<script type=text/javascript>"
                            + "alert('Berhasil Menambahkan Ke Payment !');");
                    out.println("</script>");
                    dispatcher = request.getRequestDispatcher("tickets.jsp");
                    dispatcher.include(request, response);
                    break;
                case "gagal":
                    out.println("<script type=text/javascript>"
                            + "alert('Gagal membeli tiket!');");
                    out.println("</script>");
                    dispatcher = request.getRequestDispatcher("tickets.jsp");
                    dispatcher.include(request, response);
                    break;
            }
        } catch (NullPointerException e) {
            dispatcher = request.getRequestDispatcher("tickets.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher;

        HttpSession session = request.getSession();

        User user = (User) session.getAttribute("loginData");

        try {
            Ticket ticket = TicketDbUtill.getTicketById(request.getParameter("id_ticket"));
            String kursi[] = request.getParameterValues("seat");
            
            if (TransaksiDbUtill.createTransaksi(ticket, user, kursi) > 0) {
                response.sendRedirect("TravelTicket?action=berhasil");
            } else {
                response.sendRedirect("TravelTicket?action=gagal");
            }

        } catch (NullPointerException e) {
            dispatcher = request.getRequestDispatcher("tickets.jsp");
            dispatcher.forward(request, response);
        }

    }

}

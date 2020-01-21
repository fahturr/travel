/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket;

import com.travelticket.dbutill.TransaksiDbUtill;
import com.travelticket.dbutill.User;
import com.travelticket.dbutill.UserDbUtill;
import java.io.IOException;
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
public class PaymentTicket extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("payment.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action.equals("topup")) {
            try {
                HttpSession session = request.getSession();

                String saldo = request.getParameter("saldo");
                User user = (User) session.getAttribute("loginData");

                UserDbUtill.userTopUp(user, Integer.parseInt(saldo));
                response.sendRedirect("PaymentTicket");

            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(PaymentTicket.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            String idTransaksi = request.getParameter("id_transaksi");
            String idTicket = request.getParameter("id_ticket");
            String kursi[] = request.getParameterValues("seat");
            String harga = request.getParameter("harga");
            System.out.println(harga);
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("loginData");

            if (Integer.parseInt(harga) <= user.getSaldo()) {
                int hasil = TransaksiDbUtill.payTransaction(idTransaksi, idTicket, kursi);

                if (hasil > 0) {
                    response.sendRedirect("MyTicket");
                } else {
                    response.sendRedirect("PaymentTicket");
                }
            } else {
                response.sendRedirect("PaymentTicket");
            }
        }
    }

}

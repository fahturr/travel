/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.travelticket;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author fatur
 */
public class TravelTicket extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get the data from model
        String tickets[] = {"payakumbuh", "tembilahan", "padang"};
        String nama = "Fahtur";
        request.setAttribute("tickets", tickets);
        request.setAttribute("single", nama);

        //redirect to a view
        RequestDispatcher dispatcher = request.getRequestDispatcher("tickets.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher;
        
        dispatcher = request.getRequestDispatcher("tickets.jsp");
        dispatcher.forward(request, response);
    }

}

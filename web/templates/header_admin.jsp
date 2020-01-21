<%-- 
    Document   : header
    Created on : Oct 27, 2019, 7:39:23 PM
    Author     : fatur
--%>

<%@page import="com.travelticket.dbutill.Perusahaan"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link
            href="https://fonts.googleapis.com/icon?family=Material+Icons"
            rel="stylesheet"
            />
        <link 
            href="https://fonts.googleapis.com/css?family=Roboto+Slab|Ubuntu&display=swap" 
            rel="stylesheet"
            />
        <!--Import materialize.css-->
        <link
            type="text/css"
            rel="stylesheet"
            href="http://localhost:8080/travel/assets/css/materialize.min.css"
            media="screen,projection"
            />
        <link 
            type="text/css" 
            rel="stylesheet" 
            href="http://localhost:8080/travel/assets/css/style.css"
            />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Perusahaan perusahaan = (Perusahaan) session.getAttribute("loginData"); %>
        <div class="navbar-fixed">
            <nav class="green darken-1">
                <div class="nav-wrapper container">
                    <a href="" class="brand-logo">
                        <i class="material-icons" style="font-size: 4rem !important">directions_car</i>

                        <span class="nav-logo">
                            KATAPANG (Admin)
                        </span>
                    </a>
                    <ul class="right hide-on-med-and-down">
                        <%if (perusahaan == null) { %>
                        <li>
                            <a class="btn transparent" href="HomeTravel">LOGIN</a>
                        </li>
                        <li>
                            <a class="btn white green-text" href="HomeTravel?page=signup">Sign Up</a>
                        </li>
                        <% } else {%>
                        <a class='dropdown-trigger btn white green-text' href='#' data-target='dropdown1'><%= perusahaan.getNamaPerusahaan()%></a>

                        <!-- Dropdown Structure -->
                        <ul id='dropdown1' class='dropdown-content'>
                            <li><a href="TravelTicket?action=logout">Logout</a></li>
                        </ul>
                        <% }%>
                    </ul>
                </div>
            </nav>
        </div>


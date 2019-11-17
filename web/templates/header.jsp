<%-- 
    Document   : header
    Created on : Oct 27, 2019, 7:39:23 PM
    Author     : fatur
--%>

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
            href="http://localhost:8080/travel2/assets/css/materialize.min.css"
            media="screen,projection"
            />
        <link 
            type="text/css" 
            rel="stylesheet" 
            href="http://localhost:8080/travel2/assets/css/style.css" 
            />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="navbar-fixed">
            <nav class="green darken-1">
                <div class="nav-wrapper container">
                    <a href="#" class="brand-logo">
                        <i class="material-icons" style="font-size: 4rem !important">directions_car</i>
                        <span class="nav-logo">
                            KATAPANG
                        </span>
                    </a>
                    <ul class="right hide-on-med-and-down">
                        <li>
                            <a class="btn transparent" href="login.jsp">LOGIN</a>
                        </li>
                        <li>
                            <a class="btn white green-text" href="signup.jsp">Sign Up</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="container">
            <div class="navigation" id="navigation">
                <button class="one butt active">
                    Order
                </button>
                <button class="two butt">
                    My Ticket
                </button>
                <button class="three butt">
                    Payment
                </button>
            </div>
        </div>



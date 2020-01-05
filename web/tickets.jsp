<%-- 
    Document   : tickets
    Created on : Oct 27, 2019, 7:32:03 PM
    Author     : fatur
--%>

<%@page import="com.travelticket.dbutill.TicketDbUtill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travelticket.dbutill.Ticket"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header.jsp" %>
<% ArrayList<Ticket> tickets = TicketDbUtill.getTicketList();%>
<div class="container">
    <div class="content">
        <div class="row">
            <form>
                <div class="col m3">
                    <div class="input-field">
                        <select>
                            <option value="All" selected>All</option>
                            <option value="Tembilahan">Tembilahan</option>
                            <option value="Kampar">Kampar</option>
                            <option value="Bagansiapiapi">Bagansiapiapi</option>
                            <option value="Pasir Pengaraian">Pasir Pengaraian</option>
                            <option value="Kerinci">Kerinci</option>
                            <option value="Duri">Duri</option>
                        </select>
                        <label>Destination</label>
                    </div>
                    <input type="text" class="datepicker" id="date">
                </div>
<!--                <div class="col m3 offset-m6">
                    <label for="">Seat</label>
                    <div class="seats" id="seat">
                        <center>
                            <div class="row">
                                <div class="col m12">
                                    <label>
                                        <input type="checkbox" class="filled-in" disabled="disabled"/>
                                        <span></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" class="filled-in" name="seat"/>
                                        <span></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" class="filled-in" name="seat"/>
                                        <span></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" class="filled-in" name="seat"/>
                                        <span></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" class="filled-in" name="seat"/>
                                        <span></span>
                                    </label>
                                    <label>
                                        <input type="checkbox" class="filled-in" name="seat"/>
                                        <span></span>
                                    </label>
                                </div>
                            </div>
                        </center>
                    </div>
                </div>-->
            </form>
        </div>
        <div class="ticketsss">
            <div class="row">
                <div class="col m12" id="tickets">
                    <% for (int i = 0; i < tickets.size(); i++) {%>
                    <form class="ticket"action="TravelTicket?action=buy&id=<%= tickets.get(i).getIdTicket()%>" method="post">
                        <span><%= tickets.get(i).getPerusahaan().getNamaPerusahaan()%></span>
                        <span><%= tickets.get(i).getTanggal()%></span>
                        <span><%= tickets.get(i).getWaktu()%></span>
                        <span><%= tickets.get(i).getTujuan()%></span>
                        <span><%= tickets.get(i).getHarga()%></span>
                        <div class="seats" id="seat">
                            <center>
                                <div class="row">
                                    <div class="col m12">
                                        <label>
                                            <input type="checkbox" class="filled-in" disabled="disabled"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <input type="checkbox" class="filled-in" name="seat"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <input type="checkbox" class="filled-in" name="seat"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <input type="checkbox" class="filled-in" name="seat"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <input type="checkbox" class="filled-in" name="seat"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <input type="checkbox" class="filled-in" name="seat"/>
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                            </center>
                        </div>
                        <a class="btn green darken-1">Buy</a>
                    </form>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jsp" %>

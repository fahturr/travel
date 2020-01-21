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
                <div class="col m4 offset-m2">
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
                </div>
                <div class="col m4 offset-m1">
                    <label>Date</label>
                    <input type="text" class="datepicker" id="date">
                </div>
            </form>
        </div>
        <div class="ticketsss">
            <div class="row">
                <div class="col m12" id="tickets">
                    <% for (int i = 0; i < tickets.size(); i++) {%>
                    <form class="ticket" action="TravelTicket" method="post">
                        <input type="hidden" name="id_ticket" value="<%= tickets.get(i).getIdTicket()%>" />
                        <span><%= tickets.get(i).getPerusahaan().getNamaPerusahaan()%></span>
                        <span><%= tickets.get(i).getTanggal()%></span>
                        <span><%= tickets.get(i).getWaktu()%></span>
                        <span><%= tickets.get(i).getTujuan()%></span>
                        <span><%= TicketDbUtill.formatHarga(Integer.parseInt(tickets.get(i).getHarga()))%></span>
                        <div class="seats" id="seat">
                            <center>
                                <div class="row">
                                    <div class="col m12">
                                        <label>
                                            <input type="checkbox" class="filled-in" disabled="disabled"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <% if (tickets.get(i).getKursiSatu().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="1"/>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="1" checked="checked" disabled="disabled"/>
                                            <% } %>
                                            <span></span>
                                        </label>
                                        <label>
                                            <% if (tickets.get(i).getKursiDua().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="2"/>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="2" checked="checked" disabled="disabled"/>
                                            <% } %>
                                            <span></span>
                                        </label>
                                        <label>
                                            <% if (tickets.get(i).getKursiTiga().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="3"/>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="3" checked="checked" disabled="disabled"/>
                                            <% } %>
                                            <span></span>
                                        </label>
                                        <label>
                                            <% if (tickets.get(i).getKursiEmpat().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="4"/>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="4" checked="checked" disabled="disabled"/>
                                            <% } %>
                                            <span></span>
                                        </label>
                                        <label>
                                            <% if (tickets.get(i).getKursiLima().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="5"/>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="5" checked="checked" disabled="disabled"/>
                                            <% } %>
                                            <span></span>
                                        </label>
                                    </div>
                                </div>
                            </center>
                        </div>
                        <% if (user != null) {%>
                        <button class="btn green darken-1" type="submit">Buy</button>
                        <% } else { %>
                        <button class="btn green darken-1" type="submit" disabled="disabled">Buy</button>
                        <% } %>
                    </form>
                    <%}%>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jsp" %>

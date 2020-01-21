<%-- 
    Document   : myticket
    Created on : Nov 17, 2019, 2:41:01 PM
    Author     : fatur
--%>

<%@page import="com.travelticket.dbutill.TransaksiDbUtill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.travelticket.dbutill.Transaksi"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="templates/header.jsp" %>
<%
    ArrayList<Transaksi> transaksis = null;
    if (user != null) {
        transaksis = TransaksiDbUtill.getTransactionMyTicket(user.getIdUser());
    }
%>
<div class="container">
    <div class="content">
        <div class="ticketsss" style="height: 48vh">
            <div class="row">
                <div class="col m12" id="tickets">
                    <% if (transaksis != null) {
                            for (int i = 0; i < transaksis.size(); i++) {
                    %>
                    <div class="ticket">
                        <span><%= transaksis.get(i).getTicket().getPerusahaan().getNamaPerusahaan()%> </span>
                        <span><%= transaksis.get(i).getTicket().getTanggal()%></span>
                        <span><%= transaksis.get(i).getTicket().getWaktu()%></span>
                        <span><%= transaksis.get(i).getTicket().getTujuan()%></span>
                        <span><%= transaksis.get(i).getTicket().getHarga()%></span>
                        <div class="seats" id="seat">
                            <center>
                                <div class="row">
                                    <div class="col m12">
                                        <label>
                                            <input type="checkbox" class="filled-in" disabled="disabled"/>
                                            <span></span>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiSatu().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" />
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" disabled="disabled" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiDua().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" />
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" disabled="disabled" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiTiga().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" />
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" disabled="disabled" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiEmpat().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" />
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" disabled="disabled" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiLima().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" />
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" disabled="disabled" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                    </div>
                                </div>
                            </center>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <center>
                        <div>
                            Don't have any ticket yet!
                        </div>
                    </center>
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jsp" %>
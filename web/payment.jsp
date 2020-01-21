<%-- 
    Document   : payment
    Created on : Jan 4, 2020, 1:57:28 PM
    Author     : fatur
--%>

<%@page import="com.travelticket.dbutill.TicketDbUtill"%>
<%@page import="com.travelticket.dbutill.TransaksiDbUtill"%>
<%@page import="com.travelticket.dbutill.Transaksi"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="templates/header.jsp" %>
<%
    ArrayList<Transaksi> transaksis = null;
    if (user != null) {
        transaksis = TransaksiDbUtill.getTransactionPayment(user.getIdUser());
    }
%>


<div class="container">
    <div class="content">
        <div class="row">
            <div class="col m2 offset-m3">
                <div class="input-field">
                    <input disabled value="<% if (user != null) {
                            out.print(user.getSaldo());
                        } %><% else { %> 0 <% } %>" id="disabled" type="text" class="validate">
                    <label for="disabled">Saldo (Rp)</label>
                </div>
            </div>
            <div class="col m2 offset-m3" style="margin-top: 1vw">
                <% if (user != null) {%>
                <button data-target="modal1" class="btn modal-trigger">Top Up</button>
                <% } else { %>
                <button data-target="modal1" class="btn modal-trigger" disabled="disabled">Top Up</button>
                <% } %>
                <!-- Modal Structure -->
                <div id="modal1" class="modal" style="width: 60vh !important; height: 30vh !important">
                    <div class="modal-content" >
                        <form method="post" action="PaymentTicket?action=topup">
                            <h4>Top Up</h4>
                            <div class="input-field col">
                                <% if (user != null) {%>
                                <input type="hidden" name="id_user" value="<%= user.getIdUser()%>">
                                <% } %>
                                <select name="saldo">
                                    <option value="" disabled selected>Choose your option</option>
                                    <option value="100000">Rp.100.000</option>
                                    <option value="200000">Rp.200.000</option>
                                    <option value="500000">Rp.500.000</option>
                                    <option value="1000000">Rp.1.000.000</option>
                                </select>
                                <label>Pilih Saldo</label>
                                <button class="btn green darken-1" type="submit">Pay</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="ticketsss" style="height: 48vh">
            <div class="row">
                <div class="col m12" id="tickets">
                    <% if (transaksis != null) {
                            for (int i = 0; i < transaksis.size(); i++) {
                    %>
                    <form class="ticket" action="PaymentTicket?action=pay" method="post">
                        <input type="hidden" name="id_ticket" value="<%= transaksis.get(i).getTicket().getIdTicket()%>">
                        <input type="hidden" name="id_transaksi" value="<%= transaksis.get(i).getIdTransaksi()%>">
                        <input type="hidden" name="harga" value="<%= transaksis.get(i).getTicket().getHarga()%>" >
                        <span><%= transaksis.get(i).getTicket().getPerusahaan().getNamaPerusahaan()%> </span>
                        <span><%= transaksis.get(i).getTicket().getTanggal()%></span>
                        <span><%= transaksis.get(i).getTicket().getWaktu()%></span>
                        <span><%= transaksis.get(i).getTicket().getTujuan()%></span>
                        <span><%= TicketDbUtill.formatHarga(Integer.parseInt(transaksis.get(i).getTicket().getHarga())) %></span>
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
                                            <input type="checkbox" class="filled-in" name="seat" value="1" />
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="1" checked="checked" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiDua().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="2"/>
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="2" checked="checked" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiTiga().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="3"/>
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="3" checked="checked" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiEmpat().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="4"/>
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="4" checked="checked" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                        <label>
                                            <% if (transaksis.get(i).getTicket().getKursiLima().equals("0")) { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="5"/>
                                            <span></span>
                                            <% } else { %>
                                            <input type="checkbox" class="filled-in" name="seat" value="5" checked="checked" />
                                            <span></span>
                                            <% } %>
                                        </label>
                                    </div>
                                </div>
                            </center>
                        </div>
                        <button class="btn green darken-1" type="submit">Pay</button>
                    </form>
                    <%
                        }
                    } else {
                    %>
                    <center>
                        <div>
                            Buy Ticket First !
                        </div>
                    </center>
                    <% }%>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jsp" %>

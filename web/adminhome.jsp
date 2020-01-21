<%-- 
    Document   : tickets
    Created on : Oct 27, 2019, 7:32:03 PM
    Author     : fatur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header_admin.jsp" %>
<% if (perusahaan == null) {
        response.sendRedirect("TravelAdmin");
    }
%>
<div class="container" style="margin-top:10vh;">
    <div class="content" style=" display: flex ; justify-content: center ; align-items: center ">
        <form>
            <div class="row">
                <div class="col m6">
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
                <div class="col m6">
                    <label>Date</label>
                    <input type="text" class="datepicker" id="date">
                </div>
            </div>
            <div class="row">
                <div class="col m6">
                    <label>Time</label>
                    <input type="text" class="timepicker" id="Time">
                </div>
                <div class="col m6">
                    <label for="first_name">Price (Rp)</label>
                    <input placeholder="200000" id="first_name" type="text" class="validate">
                </div>
            </div>
            <div class="row">
                <div class="col m2">
                    <button class="btn green darken-1" type="submit">Buy</button>
                </div>
            </div>
        </form>
    </div>
</div>

<%@include file="templates/footer_admin.jsp" %>

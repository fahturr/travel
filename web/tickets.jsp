<%-- 
    Document   : tickets
    Created on : Oct 27, 2019, 7:32:03 PM
    Author     : fatur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="templates/header.jsp" %>

<div class="container">
    <div class="content">
        <div class="row">
            <div class="col m3">
                <div class="input-field">
                    <select>
                        <option value="" disabled selected>Choose one</option>
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
            <div class="col m2 offset-m2">
                <div class="input-field">
                    <select>
                        <option value="" disabled selected>Choose one</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                    <label>Passanger</label>
                </div>
            </div>
            <div class="col m3 offset-m2">
                <div class="input-field">
                    <select>
                        <option value="" disabled selected>Choose your option</option>
                        <option value="Tembilahan">Tembilahan</option>
                        <option value="Kampar">Kampar</option>
                        <option value="Bagansiapiapi">Bagansiapiapi</option>
                        <option value="Pasir Pengaraian">Pasir Pengaraian</option>
                        <option value="Kerinci">Kerinci</option>
                        <option value="Duri">Duri</option>
                    </select>
                    <label>Seat</label>
                </div>
            </div>
        </div>
        <div class="ticketsss">
            <div class="row">
                <div class="col m12" id="tickets">
                    <div class="ticket">
                        <span>PT Sinar Abu Abu</span>
                        <span>15:30</span>
                        <span>Tembilahan</span>
                        <span>Rp.250.000</span>
                        <a class="btn green darken-1">Buy</a>
                    </div>
                    <div class="ticket">
                        <span>PT Cahaya Ilahi</span>
                        <span>12:30</span>
                        <span>Kampar</span>
                        <span>Rp.150.000</span>
                        <a class="btn green darken-1">Buy</a>
                    </div>
                    <div class="ticket">
                        <span>PT Sinar Abu Abu</span>
                        <span>15:30</span>
                        <span>Tembilahan</span>
                        <span>Rp.250.000</span>
                        <a class="btn green darken-1">Buy</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@include file="templates/footer.jsp" %>


<%-- 
    Document   : signup
    Created on : Nov 10, 2019, 9:43:56 PM
    Author     : fatur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="templates/header_home.jsp" %>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" action="login.jsp">
                <span class="login100-form-title">
                    Sign Up
                </span>
                <div class="wrap-input100 validate-input m-b-16" data-validate="Nama Depan">
                    <input class="input100" type="text" name="namadepan" placeholder="Nama Depan">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input m-b-16" data-validate="Nama Belakang">
                    <input class="input100" type="text" name="namabelakang" placeholder="Nama Belakang">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                    <input class="input100" type="text" name="username" placeholder="Username">
                    <span class="focus-input100"></span>
                </div>
                <div class="wrap-input100 validate-input" data-validate = "Please enter password">
                    <input class="input100" type="password" name="pass" placeholder="Password">
                    <span class="focus-input100"></span>
                </div>
                <div class="text-right p-t-13 p-b-23"></div>
                <div class="container-login100-form-btn">
                    <button class="login100-form-btn">
                        Sign Up
                    </button>
                </div>
                <br/>
                <div class="flex-col-c p-t-170 p-b-40">
                    <span class="txt1 p-b-9">
                        Already have an account ?
                    </span>
                    <a href="login.jsp" class="txt3">
                        Login
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="templates/footer_home.jsp" %>


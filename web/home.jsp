<%-- 
    Document   : home
    Created on : Oct 27, 2019, 6:52:03 PM
    Author     : fatur
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">i
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Wisuda secepatnya !</h1>
        <c:forEach items="${tickets}" var="items">
            <h1>${items}</h1>
        </c:forEach>
            <h1><c:out value="${single}" ></c:out></h1>
    </body>
</html>

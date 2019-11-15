<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 14/11/2019
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="header.jsp" %>

    <title>Ops - Erramos!</title>
</head>
<div class="container-fluid">
    <div>
        <header>
            <%@include file="menu_home.jsp" %>
        </header>

        <!--Sessão principal-->
        <main class="container main_system_container">
            <h1> Erramos ou alguma coisa não saiu como deveria.</h1>
            <h2> Pedimos desculpas e retorne para a nossa home.</h2>
        </main>

        <!--Rodapé-->
        <footer class="nav navbar-expand navbar-light fixed-bottom">
            <%@include file="footer_home.jsp" %>
        </footer>
    </div>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

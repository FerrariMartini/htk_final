<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 31/10/2019
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <!--determinando padrões de caracteres-->
    <meta charset="UTF-8" name="Keywords" content="saúde, monitoramento, health track">
    <!--determinando autor da página-->
    <meta name="author" content="Healt Track Ltda">
    <!--determinando padrão de responsividade-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!--forçando o uso de CSS pelo IE-->
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <!--Descrevendo a aplicação web para google-->
    <meta name="description" content="Monitoramento inteligente da sua saúde.">

    <%@include file="header.jsp" %>

    <title>Health Track - Home</title>

</head>

<body>
<div class="container-fluid">
    <div class="bg_container">
        <header>
            <%@include file="menu_home.jsp" %>
        </header>

        <!--Sessão principal-->
        <main>
            <div class="container home">
                <h1>Cuidando<br>da sua saúde.</h1>
                <div>
                    <a class="btn btn-primary btn-lg" href="register_user.jsp" role="button">Usar
                        Gratuitamente</a>
                    <a id="botao" class="btn btn-success btn-lg" href="register_user.jsp" role="button">Assinar o
                        Premium</a>
                </div>
            </div>
        </main>

        <!--Rodapé-->
        <footer class="nav navbar-expand navbar-light">
            <%@include file="footer_home.jsp" %>
        </footer>
    </div>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

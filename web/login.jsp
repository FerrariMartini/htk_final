<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 31/10/2019
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>Health Track - Login</title>

</head>

<body>
<div class="container-fluid">
    <header>
        <%@include file="menu_login_register.jsp" %>
    </header>
    <!--Sessão de login-->
    <section class="row justify-content-center">
        <div class="card login_card">
            <c:if test="${not empty err}">
                <div class="alert alert-danger text-center">${err}</div>
            </c:if>
            <div class="card-header">
                ACESSAR MEU HEALTH TRACK
            </div>
            <div class="card-body">
                <form action="Logar" method="post">
                    <div class="form-group">
                        <label for="getEmail">Email do Usuário</label>
                        <input type="email" class="form-control" id="getEmail" name="login"
                               aria-describedby="emailHelp" placeholder="Inserir email" required>
                        <small id="emailHelp" class="form-text text-muted">ex: jose@gmail.com</small>
                        <small id="validEmailMsg" class="validStyle"></small>
                    </div>
                    <div class="form-group">
                        <label for="getPassword">Insira sua senha</label>
                        <input type="password" class="form-control" id="getPassword" name="pwd"
                               aria-describedby="pwdHelp" placeholder="Senha com mínimo de 4 dígitos" required>
                        <small id="pwdHelp" class="form-text text-muted">ex: Jps325654</small>
                        <small id="validPwdMsg" class="validStyle"></small>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-success btn-block">ACESSAR</button>
                    </div>
                </form>

                <a href="#" class="btn btn-link btn-sm col-12" role="button">Recuperar minha
                    Senha</a>

                <div class="card-footer">
                    <p class="text-muted">Não tenho uma conta ainda</p>
                    <a href="register_user.jsp" class="btn btn-outline-primary btn-md">FAZER UMA CONTA
                        GRATUITA</a>
                </div>
            </div>
        </div>
    </section>

    <!--Rodapé -->
    <footer class="nav navbar-expand navbar-light">
        <%@include file="footer_home.jsp" %>
    </footer>
</div>
<script src="js/login.js"></script>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

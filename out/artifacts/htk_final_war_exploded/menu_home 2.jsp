<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 05/11/2019
  Time: 00:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-sm fixed-top navbar-light">

    <div class="container align-items-center">

        <div class="brand_container">
            <a class="navbar-brand" href="index.jsp"><h2 class="logoHTK">Health Track</h2></a>
        </div>

        <div class="phone_container">
            <i id="phoneIcon" class="fas fa-phone-alt icon_color md20 mt-2"></i>
            <a class="nav-link" href="tel:3030-1234">3030-1234</a>
        </div>


        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div id="menu" class="collapse navbar-collapse menu_container">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="#">Planos</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="register_user.jsp">Cadastrar</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

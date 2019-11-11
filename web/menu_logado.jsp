<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 05/11/2019
  Time: 00:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-expand-sm fixed-top navbar-light">

    <div class="container align-items-center">

        <div class="brand_container">
            <a class="navbar-brand" href="index.jsp"><h2 class="logoHTK">Health Track</h2></a>
        </div>

        <button aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"
                class="navbar-toggler"
                data-target="#menu" data-toggle="collapse" type="button">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="container">
            <div class="collapse navbar-collapse justify-content-end" id="menu">
                <ul class="nav nav-pills">
                    <li class="nav-item">
                        <a class="nav-link active" href="dashboard.jsp">Resumo da minha Saúde</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="my_day_page.jsp">Meu Dia</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="my_account.jsp">Meus Dados</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="goals.jsp">Minhas Metas</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Sair</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

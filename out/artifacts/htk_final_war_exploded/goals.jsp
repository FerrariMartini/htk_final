<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!--determinando padrões de caracteres-->
    <meta charset="UTF-8" content="saúde, monitoramento, health track" name="Keywords">
    <!--determinando autor da página-->
    <meta content="Healt Track Ltda" name="author">
    <!--determinando padrão de responsividade-->
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <!--forçando o uso de CSS pelo IE-->
    <meta content="IE-edge" http-equiv="X-UA-Compatible">
    <!--Descrevendo a aplicação web para google-->
    <meta content="Monitoramento inteligente da sua saúde." name="description">

    <%@include file="header.jsp" %>
    <title>Health Track - Metas</title>

</head>

<body>
<div class="container-fluid">
    <header>
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
                                <a class="nav-link " href="dashboard.jsp">Resumo da minha Saúde</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="my_day_page.jsp">Meu Dia</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="my_account.jsp">Meus Dados</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="goals.jsp">Minhas Metas</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Sair</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>

    </header>

    <main>
        <section class="container main_system_container">
            <c:if test="${not empty sucess}">
                <div class="alert alert-success text-center">${sucess}</div>
            </c:if>
            <c:if test="${not empty err}">
                <div class="alert alert-danger text-center">${err}</div>
            </c:if>
            <div class="card myday_card mt-5">
                <div class="card-header">
                    <div class="row no-gutters tip_text">
                        <div class="flex-column text-center">
                            <i class="fas fa-bullseye"></i>
                            &nbsp; Inserir aqui suas Metas
                        </div>
                    </div>
                </div>
                <div class="card-body">
                    <form action="Metas" method="post">
                        <div class="form-row justify-content-around">
                            <div class="col-auto">
                                <label for="exercises_goal">&nbsp;Atividades Físicas</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-running icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="exercises_goal" placeholder="3.600"
                                           name="e">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Calorias queimadas/dia</small>
                                </div>
                            </div>

                            <div class="col-auto">
                                <label for="meals_goals">&nbsp;Hábitos Alimentares</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-utensils icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="meals_goals" placeholder="2.400"
                                           name="m">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Calorias consumidas/dia</small>
                                </div>
                            </div>

                            <div class="col-auto">
                                <label for="hydration_goals">&nbsp;Nível de Hidratação</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-glass-whiskey icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="hydration_goals" placeholder="4,0"
                                           name="h">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Litros ingeridos/dia</small>
                                </div>
                            </div>

                            <div class="col-auto">
                                <label for="weight_goals">&nbsp;Meu Peso Ideal</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-weight icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="weight_goals" placeholder="84" name="w">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Kilos</small>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer card_footer_my_day">
                            <button type="button" class="btn btn-lg">
                                <i class="material-icons md20 icon_gray" id="update">create</i>
                            </button>
                            <button type="submit" class="btn btn-success btn-sm" id="save">SALVAR</button>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%--<script src="js/goals.js"></script>--%>

</body>
</html>
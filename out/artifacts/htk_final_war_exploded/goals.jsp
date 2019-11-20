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
        <%@include file="menu_interno.jsp" %>
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
                            <div class="flex-column">
                                <label for="exercises_goal">&nbsp;Atividades Físicas</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-running icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="exercises_goal" placeholder="3.600"
                                           name="eg" value="${requestScope.goals.get(0)}">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Calorias queimadas/dia</small>
                                </div>
                            </div>

                            <div class="flex-column">
                                <label for="meals_goals">&nbsp;Hábitos Alimentares</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-utensils icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="meals_goals" placeholder="2.400"
                                           name="mg">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Calorias consumidas/dia</small>
                                </div>
                            </div>

                            <div class="flex-column">
                                <label for="hydration_goals">&nbsp;Nível de Hidratação</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-glass-whiskey icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="hydration_goals" placeholder="4,0"
                                           name="hg">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Litros ingeridos/dia</small>
                                </div>
                            </div>
                            <div class="flex-column">
                                <label for="weight_goals">&nbsp;Meu Peso Ideal</label>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text"><i
                                                class="fas fa-weight icon_gray"></i>
                                        </div>
                                    </div>
                                    <input type="text" class="form-control" id="weight_goals" placeholder="84"
                                           name="wg">
                                </div>
                                <div class="mb-3 text-right">
                                    <small>Kilos</small>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer card_footer_my_day">
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
<script src="js/goals.js"></script>

</body>
</html>
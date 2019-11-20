<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 31/10/2019
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<!DOCTYPE html>
<html lang="pt-BR">
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

    <title>Health Track - Dashboard</title>

</head>

<body>
<div class="container-fluid">
    <header>
        <%@include file="menu_interno.jsp" %>
    </header>

    <!--Sessão principal -->
    <main>
        <section class="container main_system_container">
            <div class="container container_hearder_dashboard">
                <c:if test="${not empty sucess}">
                    <div class="alert alert-success text-center">${sucess}</div>
                </c:if>
                <c:if test="${not empty err}">
                    <div class="alert alert-danger text-center">${err}</div>
                </c:if>
                <div class="form-row align-items-center justify-content-around mb-2">
                    <c:if test="${not empty uName}">
                        <div class="row justify-content-center">
                            <div class="flex-column">
                                <h3 id="greetingDayStyleText">Olá <strong><strong>${uName}.</strong></strong><br>Realize
                                    uma busca para ver seus dados. &#128512;</h3>
                            </div>
                        </div>
                    </c:if>
                    <form id="findDay" action="Dashboard" method="post">
                        <div class="row justify-content-center">
                            <div class="flex-column">
                                <h4 id="currentDayStyleText">RESUMO<br/>DO DIA:</h4>
                            </div>
                            <div id="container-datePicker" class="flex-column">
                                <div class="input-group">
                                    <i class="far fa-calendar-alt md20 icon_gray input-group-text mt-1"></i>
                                    <div class="input-group-prepend">
                                        <input type="text" class="form-control" name="dateToday"
                                               id="current_date" required>
                                    </div>
                                </div>
                            </div>
                            <div class="flex-column">
                                <button class="btn btn-success btn-sm" form="findDay" type="submit">BUSCAR</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="row justify-content-around">
                <!-- PESO -->
                <div class="card dashboard_card" id="peso">
                    <div class="dash_card_body">
                        <div class="row no-gutters align-items-end">
                            <div class="col-auto goal-text borderBottom-customized">
                                <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                            </div>
                            <c:if test="${not empty weightDash}">
                                <div class="col-auto goal-number borderBottom-customized">
                                    &nbsp;
                                    <fmt:formatNumber type="number" pattern="###.##" value="${weightDash.goal}"/>
                                    <span class="goal-measure-unit">Kg</span>
                                </div>
                            </c:if>
                            <c:if test="${empty weightDash}">
                                <div class="col-auto goal-number borderBottom-customized">
                                    &nbsp;${"0"}
                                    <span class="goal-measure-unit">Kg</span>
                                </div>
                            </c:if>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">VOCÊ PERDEU<br>OU GANHOU
                            </div>
                            <c:if test="${not empty weightDash}">
                                <div class="col-auto achieved-number-green">&nbsp;
                                    <fmt:formatNumber type="number" pattern="###.##" value="${weightDash.lost}"/>
                                    <span class="goal-measure-unit">Kg</span>
                                </div>
                            </c:if>
                            <c:if test="${empty weightDash}">
                                <div class="col-auto achieved-number-green">&nbsp;${"0"}
                                    <span class="goal-measure-unit">Kg</span>
                                </div>
                            </c:if>
                        </div>
                        <div class="row">
                            <div class="row no-gutters">
                                <div class="col-auto align-self-center weight-text">ÚLTIMO<br>PESO
                                </div>
                                <c:if test="${not empty weightDash}">
                                    <div class="col-auto weight-number">&nbsp;
                                        <fmt:formatNumber type="number" pattern="###.##"
                                                          value="${weightDash.lastWeight}"/>
                                        <span class="goal-measure-unit">&nbsp;Kg</span>
                                    </div>
                                </c:if>

                                <c:if test="${empty weightDash}">
                                    <div class="col-auto weight-number">&nbsp;${"0"}
                                        <span class="goal-measure-unit">&nbsp;Kg</span>
                                    </div>
                                </c:if>
                            </div>
                            <div class="row no-gutters">
                                <div class="col-auto align-self-center weight-text">PESO<br>ATUAL
                                </div>
                                <c:if test="${not empty weightDash}">
                                    <div class="col-auto weight-number">&nbsp;
                                        <fmt:formatNumber type="number"
                                                          pattern="###.##"
                                                          value="${weightDash.initWeight}"/>
                                        <span class="goal-measure-unit">&nbsp;Kg</span>
                                    </div>
                                </c:if>

                                <c:if test="${empty weightDash}">
                                    <div class="col-auto weight-number">&nbsp;${"0"}
                                        <span class="goal-measure-unit">&nbsp;Kg</span>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Exercicios -->
                <div class="card dashboard_card" id="Exercises">
                    <div class="dash_card_body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="flex-column goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <c:if test="${not empty exerciseDash}">
                                    <div class="flex-column goal-number borderBottom-customized">&nbsp;
                                        <fmt:formatNumber type="number" pattern="#,###.#"
                                                          value="${exerciseDash.goal}"/>
                                        <span class="goal-measure-unit">cal.</span></div>
                                </c:if>

                                <c:if test="${empty exerciseDash}">
                                    <div class="flex-column goal-number borderBottom-customized">&nbsp;${0}
                                        <span class="goal-measure-unit">cal.</span></div>
                                </c:if>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="flex-column align-self-center achieved-text">CALORIAS<br>PERDIDAS
                            </div>
                            <c:if test="${not empty exerciseDash}">
                                <div class="flex-column achieved-number-red">&nbsp;<fmt:formatNumber
                                        type="number" pattern="#,###.#"
                                        value="${exerciseDash.lostCalories}"/>
                                    <span class="goal-measure-unit">cal.</span>
                                </div>
                            </c:if>
                            <c:if test="${empty exerciseDash}">
                                <div class="flex-column achieved-number-red">&nbsp;${0}
                                    <span class="goal-measure-unit">cal.</span>
                                </div>
                            </c:if>
                        </div>

                        <div class="row no-gutters text-center">
                            <div class="flex-column align-self-center achieved-text mr-3">EXERCÍCIOS<br>REALIZADOS
                            </div>
                            <div class="justify-content-center">
                                <i class="fas fa-running md48 icon_gray"></i>
                                <br/>
                                <c:if test="${not empty exerciseDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${exerciseDash.qtdExercises}</small>
                                    </div>
                                </c:if>
                                <c:if test="${empty exerciseDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${0}</small>
                                    </div>
                                </c:if>
                            </div>
                            <div class="justify-content-center">
                                <i class="fas fa-stopwatch md48 icon_gray"></i>
                                <br/>
                                <c:if test="${not empty exerciseDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${exerciseDash.timeExercises}</small>
                                    </div>
                                </c:if>
                                <c:if test="${empty exerciseDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${"3h40min"}</small>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2 linha - IMC e Pressão Arterial-->
            <div class="row justify-content-center">
                <!-- IMC -->
                <div class="card dashboard_card">
                    <div class="dash_card_body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <c:if test="${not empty pImcDash}">
                                    <div class="col-auto goal-number borderBottom-customized">&nbsp;
                                        <fmt:formatNumber type="number"
                                                          pattern="##.#"
                                                          value="${pImcDash.goal}"/>
                                        <span class="goal-measure-unit">&nbsp;normal</span></div>
                                </c:if>

                                <c:if test="${empty pImcDash}">
                                    <div class="col-auto goal-number borderBottom-customized">&nbsp;
                                            ${0}
                                        <span class="goal-measure-unit">&nbsp;normal</span></div>
                                </c:if>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">SEU IMC<br>ATUAL É:
                            </div>
                            <c:if test="${not empty pImcDash}">
                                <div class="col-auto achieved-number-red">&nbsp;
                                    <fmt:formatNumber type="number"
                                                      pattern="##.#"
                                                      value="${pImcDash.imcCurrent}"/>
                                    <span
                                            class="goal-measure-unit">&nbsp;sobrepeso</span>
                                </div>
                            </c:if>

                            <c:if test="${empty pImcDash}">
                                <div class="col-auto achieved-number-red">&nbsp;${0}
                                    <span class="goal-measure-unit">&nbsp;sobrepeso</span>
                                </div>
                            </c:if>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-pressure-text">
                                <i class="fas fa-heartbeat"></i>&nbsp;PRESSÃO<br>ARTERIAL MÉDIA
                            </div>
                            <c:if test="${not empty pImcDash}">
                                <div class="col-auto achieved-pressure-number">
                                    &nbsp; <fmt:formatNumber type="number"
                                                             pattern="##"
                                                             value="${pImcDash.mmAvgPressure}"/>/
                                    <fmt:formatNumber type="number"
                                                      pattern="##"
                                                      value="${Float.parseFloat(pImcDash.hgAvgPressure)}"/>

                                    <span class="goal-measure-unit">&nbsp;mm Hg</span>
                                </div>
                            </c:if>
                            <c:if test="${ empty pImcDash}">
                                <div class="col-auto achieved-pressure-number">
                                    &nbsp;${0}/${0}
                                    <span class="goal-measure-unit">&nbsp;mm Hg</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 3 linha - CALORIAS CONSUMIDAS e ÁGUA CONSUMIDA-->
            <div class="row justify-content-around mb-5">
                <!-- Calorias -->
                <div class="card align-items-center dashboard_card" id="calorias">
                    <div class="dash_card_body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <c:if test="${not empty foodDash}">
                                    <div class="col-auto goal-number borderBottom-customized">&nbsp;
                                        <fmt:formatNumber type="number"
                                                          pattern="#,###.#"
                                                          value="${foodDash.goal}"/>
                                        <span class="goal-measure-unit">cal.</span></div>
                                </c:if>

                                <c:if test="${empty foodDash}">
                                    <div class="col-auto goal-number borderBottom-customized">&nbsp;${0}
                                        <span class="goal-measure-unit">cal.</span></div>
                                </c:if>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">CALORIAS<br>CONSUMIDAS
                            </div>
                            <c:if test="${not empty foodDash}">
                                <div class="col-auto achieved-number-red">&nbsp;
                                    <fmt:formatNumber type="number"
                                                      pattern="#,###.#"
                                                      value="${foodDash.gainCalories}"/>
                                    <span class="goal-measure-unit">cal.</span></div>
                            </c:if>
                            <c:if test="${ empty foodDash}">
                                <div class="col-auto achieved-number-red">&nbsp;${0}<span
                                        class="goal-measure-unit">cal.</span></div>
                            </c:if>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">REFEIÇÕES<br>REALIZADAS
                            </div>
                            <div class="text-center ml-4">
                                <i class="fas fa-coffee md20 icon_gray"></i>
                                <br/>
                                <c:if test="${ not empty foodDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${foodDash.qtdCoffeTea}</small>
                                    </div>
                                </c:if>
                                <c:if test="${empty foodDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${"0"}</small>
                                    </div>
                                </c:if>
                            </div>

                            <div class="text-center">
                                <i class="fas fa-drumstick-bite md20 icon_gray"></i>
                                <br/>
                                <c:if test="${ not empty foodDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${foodDash.qtdMainMeal}</small>
                                    </div>
                                </c:if>

                                <c:if test="${empty foodDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${"0"}</small>
                                    </div>
                                </c:if>
                            </div>

                            <div class="text-center">
                                <i class="fas fa-hamburger md20 icon_gray"></i>
                                <br/>
                                <c:if test="${ not empty foodDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${foodDash.qtdSnack}</small>
                                    </div>
                                </c:if>

                                <c:if test="${empty foodDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${"0"}</small>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ÁGUA -->
                <div class="card dashboard_card" id="agua">
                    <div class="dash_card_body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <c:if test="${not empty hydraDash}">
                                    <div class="col-auto goal-number borderBottom-customized">
                                        &nbsp;<fmt:formatNumber type="number" pattern="###.##"
                                                                value="${hydraDash.goal}"/>
                                        <span class="goal-measure-unit">&nbsp;litros</span></div>
                                </c:if>

                                <c:if test="${empty hydraDash}">
                                    <div class="col-auto goal-number borderBottom-customized">
                                        &nbsp;${0}<span
                                            class="goal-measure-unit">&nbsp;litros</span></div>
                                </c:if>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">QTD DE ÁGUA<br>CONSUMIDA
                            </div>
                            <c:if test="${not empty hydraDash}">
                                <div class="col-auto achieved-number-red">&nbsp;
                                    <fmt:formatNumber type="number" pattern="###.##"
                                                      value="${hydraDash.gainHydra}"/><span
                                            class="goal-measure-unit">&nbsp;litros.</span></div>
                            </c:if>

                            <c:if test="${empty hydraDash}">
                                <div class="col-auto achieved-number-red">&nbsp;${0}<span
                                        class="goal-measure-unit">&nbsp;litros.</span></div>
                            </c:if>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">NÍVEL DE<br>HIDRATAÇÃO
                            </div>
                            <div class="text-center ml-4">
                                <i class="fas fa-glass-whiskey md38 icon_gray"></i>
                                <br/>
                                <c:if test="${not empty hydraDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${hydraDash.qtdGalss}x</small>
                                    </div>
                                </c:if>

                                <c:if test="${empty hydraDash}">
                                    <div class="container text-center">
                                        <small class="text-qtd">${0}x</small>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/widgets/datepicker.js"></script>
</body>
</html>

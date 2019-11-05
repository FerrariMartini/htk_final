<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 31/10/2019
  Time: 19:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
    <!--refeenciando a biblioteca BootStrap-->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!--	Determinando uma Font padrão-->
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

    <!--	 Fonte da Logo Health Track-->
    <link href="https://fonts.googleapis.com/css?family=Caveat&display=swap" rel="stylesheet">

    <!-- referenciando o arquivo CSS customizado -->
    <link href="css_customized/customizedAll.css" rel="stylesheet" title="estilo principal">
    <link rel="stylesheet" href="js/jquery-ui/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="js/jquery-ui/jquery-ui.structure.min.css">

    <!--refeenciando o Jquery-->
    <script src="js/jquery-3.4.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/jquery-ui/jquery-ui.min.js"></script>
    <script src="js/widgets/datepicker.js"></script>

    <!--usando biblioteca fontawesome-->
    <script src="https://kit.fontawesome.com/9299b2b589.js"></script>

    <title>Health Track - Dashboard</title>

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
                                <a class="nav-link active" href="dashboard.jsp">Resumo da minha Saúde</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="my_day_page.jsp">Meu Dia</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="my_account.jsp">Meus Dados</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="my_account.jsp">Minhas Metas</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="login_page.jsp">Sair</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <!--Sessão principal -->
    <main>
        <section class="container main_system_container">

            <div class="container container_hearder_dashboard">
                <form>
                    <div class="form-row align-items-center justify-content-center">
                        <div class="flex-column mb-1">
                            <span id="currentDayStyleText" class="goal-text">RESUMO DO DIA:</span>
                        </div>
                        <div class="flex-column mb-1">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <label class="sr-only" for="current_date">data de hoje</label>
                                    <i class="far fa-calendar-alt md20 icon_gray mt-1 input-group-text"></i>
                                </div>
                                <input class="form-control" id="current_date" type="text">
                            </div>
                        </div>
                        <div class="flex-column mb-2 mt-2">
                            <button class="btn btn-success btn-sm" type="submit">BUSCAR</button>
                        </div>
                    </div>

                </form>
            </div>


            <div class="row justify-content-around">
                <!-- PESO -->
                <div class="card dashboard_card" id="peso">
                    <div class="card-body">
                        <div class="row no-gutters align-items-end">
                            <div class="col-auto goal-text borderBottom-customized">
                                <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                            </div>
                            <div class="col-auto goal-number borderBottom-customized">&nbsp;-8<span
                                    class="goal-measure-unit">Kg</span></div>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">VOCÊ JÁ<br>PERDEU
                            </div>
                            <div class="col-auto achieved-number-green">&nbsp;-3Kg</div>
                        </div>
                        <div class="row">
                            <div class="row no-gutters">
                                <div class="col-auto align-self-center weight-text">ÚLTIMO<br>PESO
                                </div>
                                <div class="col-auto weight-number">&nbsp;87<span
                                        class="goal-measure-unit">&nbsp;Kg</span>
                                </div>
                            </div>
                            <div class="row no-gutters">
                                <div class="col-auto align-self-center weight-text">PESO<br>ATUAL
                                </div>
                                <div class="col-auto weight-number">&nbsp;84<span
                                        class="goal-measure-unit">&nbsp;Kg</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Exercicios -->
                <div class="card dashboard_card" id="Exercises">
                    <div class="card-body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <div class="col-auto goal-number borderBottom-customized">&nbsp;3.500<span
                                        class="goal-measure-unit">cal.</span></div>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">CALORIAS<br>PERDIDAS
                            </div>
                            <div class="col-auto achieved-number-red">&nbsp;3.103<span
                                    class="goal-measure-unit">cal.</span></div>
                        </div>

                        <div class="row no-gutters text-center">
                            <div class="flex-column align-self-center achieved-text mr-3">EXERCÍCIOS<br>REALIZADOS
                            </div>

                            <div class="justify-content-center">
                                <i class="fas fa-running md48 icon_gray"></i>
                                <br/>
                                <div class="container text-center">
                                    <small class="text-qtd">2x</small>
                                </div>
                            </div>

                            <div class="justify-content-center">
                                <i class="fas fa-stopwatch md48 icon_gray"></i>
                                <br/>
                                <div class="container text-center">
                                    <small class="text-qtd">3h40min.</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 2 linha - IMC e Pressão Arterial-->
            <div class="row justify-content-center">
                <!-- IMC -->
                <div class="card dashboard_card">
                    <div class="card-body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <div class="col-auto goal-number borderBottom-customized">&nbsp;25,1<span
                                        class="goal-measure-unit">&nbsp;normal</span></div>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">SEU IMC<br>ATUAL É:
                            </div>
                            <div class="col-auto achieved-number-red">&nbsp;28,9<span
                                    class="goal-measure-unit">&nbsp;sobrepeso</span>
                            </div>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-pressure-text">
                                <i class="fas fa-heartbeat"></i>&nbsp;PRESSÃO<br>ARTERIAL MÉDIA
                            </div>
                            <div class="col-auto achieved-pressure-number">&nbsp;11,2 / 78<span
                                    class="goal-measure-unit">&nbsp;mm Hg</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- 3 linha - CALORIAS CONSUMIDAS e ÁGUA CONSUMIDA-->
            <div class="row justify-content-around mb-5">
                <!-- Calorias -->
                <div class="card align-items-center dashboard_card" id="calorias">
                    <div class="card-body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <div class="col-auto goal-number borderBottom-customized">&nbsp;2.500<span
                                        class="goal-measure-unit">cal.</span></div>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">CALORIAS<br>CONSUMIDAS
                            </div>
                            <div class="col-auto achieved-number-red">&nbsp;2.103<span
                                    class="goal-measure-unit">cal.</span></div>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">REFEIÇÕES<br>REALIZADAS
                            </div>
                            <div class="text-center ml-4">
                                <i class="fas fa-coffee md20 icon_gray"></i>
                                <br/>
                                <div class="container text-center">
                                    <small class="text-qtd">1x</small>
                                </div>
                            </div>

                            <div class="text-center">
                                <i class="fas fa-drumstick-bite md20 icon_gray"></i>
                                <br/>
                                <div class="container text-center">
                                    <small class="text-qtd">2x</small>
                                </div>
                            </div>

                            <div class="text-center">
                                <i class="fas fa-hamburger md20 icon_gray"></i>
                                <br/>
                                <div class="container text-center">
                                    <small class="text-qtd">2x</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ÁGUA -->
                <div class="card dashboard_card" id="agua">
                    <div class="card-body">
                        <table>
                            <div class="row no-gutters align-items-end">
                                <div class="col-auto goal-text borderBottom-customized">
                                    <i class="fas fa-bullseye"></i>&nbsp;sua META é:
                                </div>
                                <div class="col-auto goal-number borderBottom-customized">&nbsp;4<span
                                        class="goal-measure-unit">&nbsp;litros</span></div>
                            </div>
                        </table>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">QTD DE ÁGUA<br>CONSUMIDA
                            </div>
                            <div class="col-auto achieved-number-red">&nbsp;2,5<span
                                    class="goal-measure-unit">&nbsp;litos.</span></div>
                        </div>

                        <div class="row no-gutters">
                            <div class="col-auto align-self-center achieved-text">NÍVEL DE<br>HIDRATAÇÃO
                            </div>
                            <div class="text-center ml-4    ">
                                <i class="fas fa-glass-whiskey md38 icon_gray"></i>
                                <br/>
                                <div class="container text-center">
                                    <small class="text-qtd">8x</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</div>
</body>
</html>

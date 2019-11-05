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
    <!--refeenciando a biblioteca BootStrap-->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <!--	Determinando uma Font padrão-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">

    <!--	 Fonte da Logo Health Track-->
    <link href="https://fonts.googleapis.com/css?family=Caveat&display=swap" rel="stylesheet">

    <!-- referenciando o arquivo CSS customizado -->
    <link rel="stylesheet" href="css_customized/customizedAll.css" title="estilo principal">

    <!-- referenciando CSS do DatePicker -->
    <link rel="stylesheet" href="js/jquery-ui/jquery-ui.theme.min.css">
    <link rel="stylesheet" href="js/jquery-ui/jquery-ui.structure.min.css">

    <!--usando biblioteca Material Google-->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

    <!--refeenciando o Jquery-->
    <script src="js/jquery-3.4.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="js/my_day.js"></script>
    <script src="js/jquery-ui/jquery-ui.min.js"></script>
    <script src="js/widgets/datepicker.js"></script>
    <!-- usando fontawesome	-->
    <script src="https://kit.fontawesome.com/9299b2b589.js"></script>

    <title>Health Track - Meu Dia</title>

</head>

<body>
<div class="container-fluid">
    <header>
        <nav class="navbar navbar-expand-sm fixed-top navbar-light">

            <div class="container align-items-center">

                <div class="brand_container">
                    <a class="navbar-brand" href="index.jsp"><h2 class="logoHTK">Health Track</h2></a>
                </div>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="container">
                    <div id="menu" class="collapse navbar-collapse justify-content-end">
                        <ul class="nav nav-pills">
                            <li class="nav-item">
                                <a class="nav-link" href="dashboard.jsp">Resumo da minha Saúde</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link active" href="my_day_page.jsp">Meu Dia</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="my_account.jsp">Meus Dados</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="goals.jsp">Minhas Metas</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link " href="login.jsp">Sair</a>
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
            <div id="wrappContainerBorder">
                <form class="form-row align-items-center justify-content-around">
                    <div class="row justify-content-center">
                        <div class="flex-column">
                            <h4 id="currentDayStyleText">DADOS <br/>DO DIA:</h4>
                        </div>
                        <div id="container-datePicker" class="flex-column">
                            <div class="input-group">
                                <i class="far fa-calendar-alt md20 icon_gray input-group-text mt-1"></i>
                                <div class="input-group-prepend">
                                    <label class="sr-only" for="current_date">calendário</label>
                                    <input type="text" class="form-control" id="current_date" required>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="container-MyWeigthBox" class="row justify-content-end flex-column">
                        <div class="form-row align-items-center justify-content-center">
                            <div class="flex-column mr-3">
                                <i class="fas fa-weight icon_gray"></i>
                                <span class="goal-text">MEU PESO HOJE:</span>
                            </div>
                            <div class="flex-column">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label class="sr-only" for="currentWeight">peso do dia</label>
                                        <input type="text" class="form-control widthFormField text-center"
                                               id="currentWeight" placeholder="84,2" required>
                                        <p class="input-group-text icon_gray">Kg</p>
                                    </div>
                                </div>
                            </div>
                            <div class="flex-column">
                                <button class="btn btn-success btn-sm" type="submit">SALVAR</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

            <!--BOXs DE PREENCHIMENTO DAS INFORMAÇÕES-->
            <div class="container myday_container">
                <ul class="nav nav-pills mb-3 mt-3 justify-content-around" id="pills-tab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="workout" data-toggle="pill" href="#pills-workout" role="tab"
                           aria-controls="pills-workout" aria-selected="true">Atividades Físicas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="meals" data-toggle="pill" href="#pills-meals" role="tab"
                           aria-controls="pills-meals" aria-selected="false">Hábitos Alimentares</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="pressure" data-toggle="pill" href="#pills-pressure" role="tab"
                           aria-controls="pills-pressure" aria-selected="false">Pressão Arterial</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="hydration" data-toggle="pill" href="#pills-hydration" role="tab"
                           aria-controls="pills-hydration" aria-selected="false">Nível de Hidratação</a>
                    </li>
                </ul>

                <!--Exercicios Físicos-->
                <!--TODO: inserir e deletar os formulários em JS-->

                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show mt-5 active" id="pills-workout" role="tabpanel"
                         aria-labelledby="pills-workout-tab">
                        <div class="card myday_card">
                            <div class="card-header">
                                <div class="row no-gutters tip_text">
                                    <div class="flex-column text-center"><i class="fas fa-running"></i>
                                        &nbsp;Insira aqui
                                        suas
                                        Atividades
                                        Físicas no dia:
                                    </div>
                                    <div class="flex-column">&nbsp;13/09/2019 |</div>
                                    <div class="flex-column">&nbsp;0<span> cal. queimadas
									</span></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <table class="table table-borderless table-responsive-lg">
                                    <thead>
                                    <tr>
                                        <th>Exercícios</th>
                                        <th>Tempo</th>
                                        <th>Calorias</th>
                                    </tr>
                                    </thead>
                                    <tbody id="exerciseForm">
                                    <tr>
                                        <td>
                                            <form>
                                                <div>
                                                    <label for="exercisesList"></label><select class="custom-select"
                                                                                               id="exercisesList">
                                                    <option>Andar de bicicleta</option>
                                                    <option>Balé</option>
                                                    <option>Basquete</option>
                                                    <option>Boxe</option>
                                                    <option>Caminhada</option>
                                                    <option>Caminhada - 7km/h</option>
                                                    <option>Caminhar - 4km/h</option>
                                                    <option>Capoeira</option>
                                                    <option>Corrida</option>
                                                    <option>Dança de Salão</option>
                                                    <option>Esqui aquático</option>
                                                    <option>Esqui na neve</option>
                                                    <option>Ginástica aeróbica</option>
                                                    <option>Golfe</option>
                                                    <option>Handebol</option>
                                                    <option>Hidroginástica</option>
                                                    <option>Jiu-jitsu</option>
                                                    <option>Jogar futebol</option>
                                                    <option>Judô</option>
                                                    <option>Musculação</option>
                                                    <option>Natação</option>
                                                    <option>Remo</option>
                                                    <option>Surfe</option>
                                                    <option>Tênis</option>
                                                    <option>Vôlei</option>
                                                </select>
                                                </div>
                                            </form>
                                        </td>
                                        <td>
                                            <form>
                                                <label class="sr-only" for="currentTime<1>">tempo</label>
                                                <input type="time" class="form-control" id="currentTime<1>" required>
                                            </form>
                                        </td>

                                        <td>
                                            <form>
                                                <label class="sr-only" for="currentCalories<1>">calorias</label>
                                                <input type="text" class="form-control" name="calories"
                                                       id="currentCalories<1>"
                                                       placeholder="647" required>
                                            </form>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="card-footer card_footer_my_day">
                                <button type="button" class="btn btn-lg">
                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                </button>
                                <button type="button" class="btn btn-lg">
                                    <i class="material-icons md20 icon_gray"
                                       type="deleteField">remove_circle_outline</i>
                                </button>
                                <button type="button" class="btn btn-lg">
                                    <i class="material-icons md20 icon_gray">create</i>
                                </button>
                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                </button>
                            </div>
                        </div>
                    </div>

                    <!--Hábitos Alimentares-->
                    <div class="tab-pane fade" id="pills-meals" role="tabpanel" aria-labelledby="pills-meals-tab">
                        <br>
                        <div class="card myday_card">
                            <div class="card-header">
                                <div class="row no-gutters tip_text">
                                    <div class="flex-column text-center"><i class="fas fa-utensils"></i>
                                        &nbsp;Insira aqui suas Refeições no dia:
                                    </div>
                                    <div class="flex-column">&nbsp;13/09/2019 |</div>
                                    <div class="flex-column">&nbsp;0<span> cal. consumidas</span></div>
                                </div>
                            </div>
                            <div class="card-body">
                                <nav>
                                    <div class="nav nav-pills justify-content-around" id="nav-pills" role="tablist">
                                        <a class="nav-item nav-link active" id="coffee_break_tab"
                                           data-toggle="tab"
                                           href="#coffee_break"
                                           role="tab" aria-controls="nav-coffee" aria-selected="true">Café da
                                            Manhã</a>
                                        <a class="nav-item nav-link" id="snack_time_tab"
                                           data-toggle="tab"
                                           href="#snack_time"
                                           role="tab" aria-controls="nav-snack" aria-selected="false">Lanche da
                                            Manhã</a>
                                        <a class="nav-item nav-link" id="lunch_tab"
                                           data-toggle="tab"
                                           href="#lunch" role="tab"
                                           aria-controls="nav-lunch" aria-selected="false">Almoço</a>
                                        <a class="nav-item nav-link" id="tea_time_tab"
                                           data-toggle="tab"
                                           href="#tea_time" role="tab"
                                           aria-controls="nav-tea" aria-selected="false">Lanche da Tarde</a>
                                        <a class="nav-item nav-link" id="dinner_tab"
                                           data-toggle="tab"
                                           href="#dinner" role="tab"
                                           aria-controls="nav-dinner" aria-selected="false">Jantar</a>
                                        <a class="nav-item nav-link" id="ceia_tab"
                                           data-toggle="tab"
                                           href="#ceia" role="tab"
                                           aria-controls="nav-ceia" aria-selected="false">Ceia</a>
                                    </div>
                                </nav>
                                <br>

                                <!--Café da Manhã-->
                                <div class="tab-content" id="nav-coffee_breakContent">
                                    <div class="tab-pane fade show active" id="coffee_break" role="tabpanel"
                                         aria-labelledby="coffee_break_tab">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Alimento</th>
                                                <th>Porção</th>
                                                <th>Quantidade</th>
                                                <th>Calorias</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <form>
                                                        <div>
                                                            <label for="alimentoList<1>"></label><select
                                                                class="custom-select"
                                                                id="alimentoList<1>">
                                                            <option>Maçã</option>
                                                            <option>Banana</option>
                                                            <option>Pão francês</option>
                                                            <option>Leite</option>
                                                        </select>
                                                        </div>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="porcao01">porções</label>
                                                        <input type="text" class="form-control" name="porcao"
                                                               id="porcao01"
                                                               placeholder="100" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="qtd01">quantidade</label>
                                                        <input type="text" class="form-control" id="qtd01" name="qtd"
                                                               placeholder="2" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="calorias01">calorias</label>
                                                        <input type="text" class="form-control" name="calories"
                                                               id="calorias01"
                                                               placeholder="689" required>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!--Lanche da Manhã-->
                                    <div class="tab-pane fade" id="snack_time" role="tabpanel"
                                         aria-labelledby="snack_time_tab">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Alimento</th>
                                                <th>Porção</th>
                                                <th>Quantidade</th>
                                                <th>Calorias</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <form>
                                                        <div>
                                                            <label for="alimentosList<1>"></label><select
                                                                class="custom-select"
                                                                id="alimentosList<1>">
                                                            <option>Maçã</option>
                                                            <option>Banana</option>
                                                            <option>Pão francês</option>
                                                            <option>Leite</option>
                                                        </select>
                                                        </div>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="porcao<1>">porções</label>
                                                        <input type="text" class="form-control" name="porcao"
                                                               id="porcao<1>"
                                                               placeholder="100" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="qtd<1>">quantidade</label>
                                                        <input type="text" class="form-control" id="qtd<1>" name="qtd"
                                                               placeholder="2" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="calorias<1>">calorias</label>
                                                        <input type="text" class="form-control" name="calories"
                                                               id="calorias<1>"
                                                               placeholder="689" required>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!--Almoço-->
                                    <div class="tab-pane fade" id="lunch" role="tabpanel"
                                         aria-labelledby="lunch_tab">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Alimento</th>
                                                <th>Porção</th>
                                                <th>Quantidade</th>
                                                <th>Calorias</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <form>
                                                        <div>
                                                            <label for="alimentosList5"></label><select
                                                                class="custom-select"
                                                                id="alimentosList5">
                                                            <option>Asinha de frango</option>
                                                            <option>Peito de frango</option>
                                                            <option>Bife de porco</option>
                                                            <option>Entrecort</option>
                                                            <option>Filé mignon</option>
                                                            <option>Fraldinha</option>
                                                            <option>Maçã</option>
                                                            <option>Banana</option>
                                                            <option>Pão francês</option>
                                                            <option>Leite</option>
                                                            <option>Arroz frito</option>
                                                            <option>Espaguete à bolonhesa</option>
                                                        </select>
                                                        </div>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="porcao5">porções</label>
                                                        <input type="text" class="form-control" name="porcao"
                                                               id="porcao5"
                                                               placeholder="100" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="qtd5">quantidade</label>
                                                        <input type="text" class="form-control" name="qtd" id="qtd5"
                                                               placeholder="2" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="calorias5">calorias</label>
                                                        <input type="text" class="form-control" name="calories"
                                                               id="calorias5"
                                                               placeholder="689" required>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!--Lanche da Tarde-->
                                    <div class="tab-pane fade" id="tea_time" role="tabpanel"
                                         aria-labelledby="tea_time_tab">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Alimento</th>
                                                <th>Porção</th>
                                                <th>Quantidade</th>
                                                <th>Calorias</th>

                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <form>
                                                        <div>
                                                            <label for="alimentosList6"></label><select
                                                                class="custom-select"
                                                                id="alimentosList6">
                                                            <option>Maçã</option>
                                                            <option>Banana</option>
                                                            <option>Pão francês</option>
                                                            <option>Leite</option>
                                                        </select>
                                                        </div>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="porcao6">porções</label>
                                                        <input type="text" class="form-control" name="porcao"
                                                               id="porcao6"
                                                               placeholder="100" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="qtd6">quantidade</label>
                                                        <input type="text" class="form-control" name="qtd" id="qtd6"
                                                               placeholder="2" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="calorias6">calorias</label>
                                                        <input type="text" class="form-control" name="calories"
                                                               id="calorias6"
                                                               placeholder="689" required>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!--Jantar-->
                                    <div class="tab-pane fade" id="dinner" role="tabpanel"
                                         aria-labelledby="dinner_tab">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Alimento</th>
                                                <th>Porção</th>
                                                <th>Quantidade</th>
                                                <th>Calorias</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <form>
                                                        <div>
                                                            <label for="alimentosList7"></label><select
                                                                class="custom-select"
                                                                id="alimentosList7">
                                                            <option>Maçã</option>
                                                            <option>Banana</option>
                                                            <option>Pão francês</option>
                                                            <option>Leite</option>
                                                        </select>
                                                        </div>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="porcao7">porções</label>
                                                        <input type="text" class="form-control" name="porcao"
                                                               id="porcao7"
                                                               placeholder="100" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="qtd7">quantidade</label>
                                                        <input type="text" class="form-control" id="qtd7" name="qtd"
                                                               placeholder="2" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="calorias7">calorias</label>
                                                        <input type="text" class="form-control" name="calories"
                                                               id="calorias7"
                                                               placeholder="689" required>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>

                                    <!--CEIA-->
                                    <div class="tab-pane fade" id="ceia" role="tabpanel" aria-labelledby="ceia_tab">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Alimento</th>
                                                <th>Porção</th>
                                                <th>Quantidade</th>
                                                <th>Calorias</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <form>
                                                        <div>
                                                            <label for="alimentosList8"></label><select
                                                                class="custom-select"
                                                                id="alimentosList8">
                                                            <option>Maçã</option>
                                                            <option>Banana</option>
                                                            <option>Pão francês</option>
                                                            <option>Leite</option>
                                                        </select>
                                                        </div>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="porcao8">porções</label>
                                                        <input type="text" class="form-control" name="porcao"
                                                               id="porcao8"
                                                               placeholder="100" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="qtd8">quantidade</label>
                                                        <input type="text" class="form-control" id="qtd8" name="qtd"
                                                               placeholder=" 2" required>
                                                    </form>
                                                </td>
                                                <td>
                                                    <form>
                                                        <label class="sr-only" for="calorias8">calorias</label>
                                                        <input type="text" class="form-control" name="calories"
                                                               id="calorias8"
                                                               placeholder="689" required>
                                                    </form>
                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer card_footer_my_day">
                                <button type="button" class="btn btn-sm">
                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                </button>
                                <button type="button" class="btn btn-sm">
                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                </button>
                                <button type="button" class="btn btn-sm">
                                    <i class="material-icons md20 icon_gray">create</i>
                                </button>
                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                </button>
                            </div>
                        </div>
                    </div>

                    <!--Pressão Arterial-->
                    <div class="tab-pane fade mt-5" id="pills-pressure" role="tabpanel"
                         aria-labelledby="pills-pressure-tab">
                        <div class="card myday_card">
                            <div class="card-header">
                                <div class="row no-gutters tip_text">
                                    <div class="flex-column text-center"><i class="fas fa-heartbeat"></i>&nbsp; Inserir
                                        aqui sua Pressão Arterial do dia:
                                    </div>
                                    <div class="flex-column">&nbsp; 13/09/2019</div>
                                </div>
                            </div>
                            <div class="card-body text-center">
                                <div>
                                    <form class="row justify-content-center">
                                        <div class="form-group col-auto">
                                            <input type="text" class="form-control text-center"
                                                   id="blood_pressure" name="blood_pressure"
                                                   aria-describedby="bloodPressure" placeholder="14/8 mmHg" required>
                                            <label class="myday_pressure_text" for="blood_pressure">
                                                <small>13/04 | 8:50min</small>
                                            </label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-footer card_footer_my_day">
                                <button type="button" class="btn btn-sm">
                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                </button>
                                <button type="button" class="btn btn-sm">
                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                </button>
                                <button type="button" class="btn btn-sm">
                                    <i class="material-icons md20 icon_gray">create</i>
                                </button>
                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                </button>
                            </div>
                        </div>
                    </div>

                    <!--Nível de Hidratação-->
                    <div class="tab-pane fade mt-5" id="pills-hydration" role="tabpanel"
                         aria-labelledby="pills-hydration-tab">
                        <div class="card myday_card">
                            <div class="card-header">
                                <div class="row no-gutters tip_text">
                                    <div class="flex-column text-center"><i class="fas fa-glass-whiskey"></i>&nbsp;Preencher
                                        Consumo de Água do dia:
                                    </div>
                                    <div class="flex-column">&nbsp;13/09/2019 |&nbsp;0 litros</div>
                                </div>
                            </div>
                            <div class="card-body">
                                <div>
                                    <form class="row justify-content-center">
                                        <div class="form-group col-auto">
                                            <label for="kind_hydration">Tipo embalagem</label>
                                            <select id="kind_hydration" class="custom-select">
                                                <option>Copo de água - 250ml</option>
                                                <option>Garrafinha d'água - 500ml</option>
                                                <option>Garrafa - 1l</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-auto">
                                            <label class="" for="qtd_water">Quantidade</label>
                                            <input type="text" class="form-control text-center" id="qtd_water"
                                                   name="qtd"
                                                   aria-describedby="qtd_water" placeholder="10" required>
                                        </div>
                                    </form>
                                    <div class="card-footer card_footer_my_day">
                                        <button type="button" class="btn btn-sm">
                                            <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                        </button>
                                        <button type="button" class="btn btn-sm">
                                            <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                        </button>
                                        <button type="button" class="btn btn-sm">
                                            <i class="material-icons md20 icon_gray">create</i>
                                        </button>
                                        <button type="submit" class="btn btn-success btn-sm">SALVAR
                                        </button>
                                    </div>
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


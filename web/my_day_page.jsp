<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <title>Health Track - Meu Dia</title>

    <%@include file="header.jsp" %>

</head>

<body>
<div class="container-fluid">
    <header>
        <%@include file="menu_logado.jsp" %>
    </header>

    <!--Sessão principal -->
    <main>
        <div>
            <section class="container main_system_container">
                <div id="wrappContainerBorder">
                    <c:if test="${not empty sucess}">
                        <div class="alert alert-success text-center">${sucess}</div>
                    </c:if>
                    <c:if test="${not empty err}">
                        <div class="alert alert-danger text-center">${err}</div>
                    </c:if>
                    <div class="form-row align-items-center justify-content-around">
                        <div class="row justify-content-center">
                            <div class="flex-column">
                                <h3 id="greetingDayStyleText">Olá Ivan.<br>Lembre-se de beber muita água hoje!</h3>
                            </div>
                        </div>
                        <div class="row justify-content-center">
                            <div class="flex-column">
                                <h4 id="currentDayStyleText">DADOS <br/>DO DIA:</h4>
                            </div>
                            <div id="container-datePicker" class="flex-column">
                                <div class="input-group">
                                    <i class="far fa-calendar-alt md20 icon_gray input-group-text mt-1"></i>
                                    <div class="input-group-prepend">
                                        <input type="text" class="form-control"
                                               id="current_date" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--BOXs DE PREENCHIMENTO DAS INFORMAÇÕES-->
                <div class="container myday_container">
                    <ul class="nav nav-pills mb-3 mt-3 justify-content-around" id="pills-tab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="weight" data-toggle="pill" href="#pills-weight"
                               role="tab"
                               aria-controls="pills-weight" aria-selected="true">Peso Atual</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="workout" data-toggle="pill" href="#pills-workout"
                               role="tab"
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

                    <!--Meu peso atual-->
                    <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show mt-5 active" id="pills-weight" role="tabpanel"
                             aria-labelledby="pills-weight-tab">
                            <div class="card myday_card">
                                <div class="card-header">
                                    <div class="row no-gutters tip_text">
                                        <div class="flex-column text-center"><i class="fas fa-weight"></i>&nbsp;
                                            Insira
                                            aqui seus Pesos do dia:
                                        </div>
                                        <div class="flex-column">&nbsp; 13/09/2019</div>
                                    </div>
                                </div>
                                <div class="card-body text-center">
                                    <div>
                                        <form id="weight-form" class="row justify-content-center" action="CadastraPeso"
                                              method="get">
                                            <div class="form-group col-auto">
                                                <input type="hidden" class="hidden" id="weightDay" name="dateToday"
                                                       dataformatas="dd/mm/yyyy">
                                                <input type="text" class="form-control widthFormField text-center"
                                                       id="currentWeight" placeholder="84,2" name="weightToday"
                                                       required>
                                                <label class="myday_pressure_text" for="currentWeight">
                                                    <small>Kilogramas(Kg)</small>
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
                                    <button type="submit" form="weight-form" class="btn btn-success btn-sm">SALVAR
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!--Exercicios Físicos-->
                        <div class="tab-pane fade show mt-5" id="pills-workout" role="tabpanel"
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
                                    <form id="exercise-form" action="Exercicios" method="get">
                                        <table class="table table-borderless table-responsive-lg">
                                            <thead>
                                            <tr>
                                                <th>Exercícios</th>
                                                <th>Tempo</th>
                                                <th>Calorias</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <div>
                                                        <div>
                                                            <input type="hidden" class="hidden" id="exercise-Day" name="dateToday"
                                                                   dataformatas="dd/mm/yyyy">
                                                            <input type="text" class="form-control text-center"
                                                                   id="exerciseField" placeholder="Jogar Futebol"
                                                                   name="exercise" required>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div>
                                                        <label class="sr-only" for="exer_time">tempo</label>
                                                        <input type="time" class="form-control" id="exer_time"
                                                               name="time"
                                                               required>
                                                    </div>
                                                </td>

                                                <td>
                                                    <div>
                                                        <label class="sr-only" for="exer_cal">calorias</label>
                                                        <input type="text" class="form-control" name="exer_calories"
                                                               id="exer_cal"
                                                               placeholder="647" required>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                                <div class="card-footer card_footer_my_day">
                                    <button type="button" class="btn btn-lg">
                                        <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                    </button>
                                    <button type="button" class="btn btn-lg">
                                        <i class="material-icons md20 icon_gray"
                                           type="deleteField">remove_circle_outline</i>
                                    </button>
                                    <button type="submit" form="exercise-form" class="btn btn-success btn-sm">SALVAR
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!--Hábitos Alimentares-->
                        <div class="tab-pane fade" id="pills-meals" role="tabpanel"
                             aria-labelledby="pills-meals-tab">
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
                                        <div class="nav nav-pills justify-content-around" id="nav-pills"
                                             role="tablist">
                                            <a class="nav-item nav-link active" id="breakfast_tab"
                                               data-toggle="tab"
                                               href="#breakfast"
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
                                        <div class="tab-pane fade show active" id="breakfast" role="tabpanel"
                                             aria-labelledby="breakfast_tab">
                                            <table class="table table-borderless table-responsive-lg">
                                                <thead>
                                                <tr>
                                                    <th>Alimento</th>
                                                    <th>Porção (gramas)</th>
                                                    <th>Quantidade (unit.)</th>
                                                    <th>Calorias (kcal)</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div>
                                                            <div>
                                                                <input type="hidden"  class="hidden" id="coffe_brk-Day" name="dateToday"
                                                                       dataformatas="dd/mm/yyyy">
                                                                <input type="text" class="form-control text-center"
                                                                       id="coffee" placeholder="Café com Leite"
                                                                       name="coffe_brk" required>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="porcao_brk">porções</label>
                                                            <input type="text" class="form-control" name="porcaoBkf"
                                                                   id="porcao_brk"
                                                                   placeholder="100" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="qtd_brk">quantidade</label>
                                                            <input type="text" class="form-control" id="qtd_brk"
                                                                   name="qtdBkf"
                                                                   placeholder="2" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="calorias">calorias</label>
                                                            <input type="text" class="form-control"
                                                                   name="caloriesBkf"
                                                                   id="calorias"
                                                                   placeholder="689" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="card-footer card_footer_my_day">
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                                </button>
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                                </button>
                                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                                </button>
                                            </div>
                                        </div>

                                        <!--Lanche da Manhã-->
                                        <div class="tab-pane fade" id="snack_time" role="tabpanel"
                                             aria-labelledby="snack_time_tab">
                                            <table class="table table-borderless table-responsive-lg">
                                                <thead>
                                                <tr>
                                                    <th>Alimento</th>
                                                    <th>Porção (gramas)</th>
                                                    <th>Quantidade (unit.)</th>
                                                    <th>Calorias (kcal)</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div id="food-form">
                                                            <div>
                                                                <input type="hidden"  class="hidden" id="snack_time-Day"
                                                                       name="dateToday" dataformatas="dd/mm/yyyy">
                                                                <input type="text" class="form-control text-center"
                                                                       id="snack" placeholder="Maçã com Canela"
                                                                       name="snack_time" required>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="porcao<1>">porções</label>
                                                            <input type="text" class="form-control" name="porcao"
                                                                   id="porcao<1>"
                                                                   placeholder="100" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="qtd<1>">quantidade</label>
                                                            <input type="text" class="form-control" id="qtd<1>"
                                                                   name="qtd"
                                                                   placeholder="2" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only"
                                                                   for="calorias<1>">calorias</label>
                                                            <input type="text" class="form-control" name="calories"
                                                                   id="calorias<1>"
                                                                   placeholder="689" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="card-footer card_footer_my_day">
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                                </button>
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                                </button>
                                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                                </button>
                                            </div>
                                        </div>

                                        <!--Almoço-->
                                        <div class="tab-pane fade" id="lunch" role="tabpanel"
                                             aria-labelledby="lunch_tab">
                                            <table class="table table-borderless table-responsive-lg">
                                                <thead>
                                                <tr>
                                                    <th>Alimento</th>
                                                    <th>Porção (gramas)</th>
                                                    <th>Quantidade (unit.)</th>
                                                    <th>Calorias (kcal)</th>

                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div id=" asdad">
                                                            <div>
                                                                <input type="hidden" class="hidden" id="lunch-Day" name="dateToday"
                                                                       dataformatas="dd/mm/yyyy">
                                                                <input type="text" class="form-control text-center"
                                                                       id="lunch_time"
                                                                       placeholder="Macarrão Alho e Óleo com Brócoles"
                                                                       name="my_lunch" required>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="porcao5">porções</label>
                                                            <input type="text" class="form-control" name="porcao"
                                                                   id="porcao5"
                                                                   placeholder="100" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="qtd5">quantidade</label>
                                                            <input type="text" class="form-control" name="qtd"
                                                                   id="qtd5"
                                                                   placeholder="2" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="calorias5">calorias</label>
                                                            <input type="text" class="form-control" name="calories"
                                                                   id="calorias5"
                                                                   placeholder="689" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="card-footer card_footer_my_day">
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                                </button>
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                                </button>
                                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                                </button>
                                            </div>
                                        </div>

                                        <!--Lanche da Tarde-->
                                        <div class="tab-pane fade" id="tea_time" role="tabpanel"
                                             aria-labelledby="tea_time_tab">
                                            <table class="table table-borderless table-responsive-lg">
                                                <thead>
                                                <tr>
                                                    <th>Alimento</th>
                                                    <th>Porção (gramas)</th>
                                                    <th>Quantidade (unit.)</th>
                                                    <th>Calorias (kcal)</th>

                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div>
                                                            <div>
                                                                <input type="hidden" class="hidden" id="tea-Day" name="dateToday"
                                                                       dataformatas="dd/mm/yyyy">
                                                                <input type="text" class="form-control text-center"
                                                                       id="eat_time" placeholder="Iogurte com Granola"
                                                                       name="my_eat" required>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="porcao6">porções</label>
                                                            <input type="text" class="form-control" name="porcao"
                                                                   id="porcao6"
                                                                   placeholder="100" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="qtd6">quantidade</label>
                                                            <input type="text" class="form-control" name="qtd"
                                                                   id="qtd6"
                                                                   placeholder="2" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="calorias6">calorias</label>
                                                            <input type="text" class="form-control" name="calories"
                                                                   id="calorias6"
                                                                   placeholder="689" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="card-footer card_footer_my_day">
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                                </button>
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                                </button>
                                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                                </button>
                                            </div>
                                        </div>

                                        <!--Jantar-->
                                        <div class="tab-pane fade" id="dinner" role="tabpanel"
                                             aria-labelledby="dinner_tab">
                                            <table class="table table-borderless table-responsive-lg">
                                                <thead>
                                                <tr>
                                                    <th>Alimento</th>
                                                    <th>Porção (gramas)</th>
                                                    <th>Quantidade (unit.)</th>
                                                    <th>Calorias (kcal)</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div>
                                                            <div>
                                                                <input type="hidden" class="hidden" id="dinner-Day" name="dateToday"
                                                                       dataformatas="dd/mm/yyyy">
                                                                <input type="text" class="form-control text-center"
                                                                       id="dinner_time"
                                                                       placeholder="Pizza Mussarela e Aliche"
                                                                       name="my_dinner" required>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="porcao7">porções</label>
                                                            <input type="text" class="form-control" name="porcao"
                                                                   id="porcao7"
                                                                   placeholder="100" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="qtd7">quantidade</label>
                                                            <input type="text" class="form-control" id="qtd7"
                                                                   name="qtd"
                                                                   placeholder="2" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="calorias7">calorias</label>
                                                            <input type="text" class="form-control" name="calories"
                                                                   id="calorias7"
                                                                   placeholder="689" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="card-footer card_footer_my_day">
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                                </button>
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                                </button>
                                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                                </button>
                                            </div>
                                        </div>

                                        <!--CEIA-->
                                        <div class="tab-pane fade" id="ceia" role="tabpanel"
                                             aria-labelledby="ceia_tab">
                                            <table class="table table-borderless table-responsive-lg">
                                                <thead>
                                                <tr>
                                                    <th>Alimento</th>
                                                    <th>Porção (gramas)</th>
                                                    <th>Quantidade (unit.)</th>
                                                    <th>Calorias (kcal)</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        <div>
                                                            <div>
                                                                <input type="hidden" class="hidden" id="ceia-Day" name="dateToday"
                                                                       dataformatas="dd/mm/yyyy">
                                                                <input type="text" class="form-control text-center"
                                                                       id="ceia_time" placeholder="Frutas Secas"
                                                                       name="my_ceia" required>
                                                            </div>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="porcao8">porções</label>
                                                            <input type="text" class="form-control" name="porcao"
                                                                   id="porcao8"
                                                                   placeholder="100" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="qtd8">quantidade</label>
                                                            <input type="text" class="form-control" id="qtd8"
                                                                   name="qtd"
                                                                   placeholder=" 2" required>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div>
                                                            <label class="sr-only" for="calorias8">calorias</label>
                                                            <input type="text" class="form-control" name="calories"
                                                                   id="calorias8"
                                                                   placeholder="689" required>
                                                        </div>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="card-footer card_footer_my_day">
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                                </button>
                                                <button type="button" class="btn btn-sm">
                                                    <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                                </button>
                                                <button type="submit" class="btn btn-success btn-sm">SALVAR
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Pressão Arterial-->
                        <div class="tab-pane fade mt-5" id="pills-pressure" role="tabpanel"
                             aria-labelledby="pills-pressure-tab">
                            <div class="card myday_card">
                                <div class="card-header">
                                    <div class="row no-gutters tip_text">
                                        <div class="flex-column text-center"><i class="fas fa-heartbeat"></i>&nbsp;
                                            Inserir
                                            aqui sua Pressão Arterial do dia:
                                        </div>
                                        <div class="flex-column">&nbsp; 13/09/2019</div>
                                    </div>
                                </div>
                                <div class="card-body text-center">
                                    <div>
                                        <form id="pressure-form" class="row justify-content-center" action="Pressao"
                                              method="get">
                                            <div class="form-group col-auto">
                                                <input type="hidden" class="hidden" id="pressure-Day" name="dateToday"
                                                       dataformatas="dd/mm/yyyy">
                                                <input type="text" class="form-control text-center"
                                                       id="blood_pressure" name="blood_pressure"
                                                       aria-describedby="bloodPressure" placeholder="14/8"
                                                       required>
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
                                    <button type="submit" form="pressure-form" class="btn btn-success btn-sm">SALVAR
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
                                        <form id="hydra-form" class="row justify-content-center" action="Hidratar"
                                              method="get">
                                            <input type="hidden" class="hidden" id="hydra-Day" name="dateToday"
                                                   dataformatas="dd/mm/yyyy">
                                            <div class="form-group col-auto">
                                                <label for="kind_hydration">Tipo embalagem</label>
                                                <select id="kind_hydration" class="custom-select" name="hydra_option">
                                                    <option value="copo">Copo de água - 250ml</option>
                                                    <option value="pet500">Garrafinha d'água - 500ml</option>
                                                    <option value="pet1">Garrafa - 1l</option>
                                                </select>
                                            </div>
                                            <div class="form-group col-auto">
                                                <label class="" for="unit_water">Quantidade (unidade)</label>
                                                <input type="text" class="form-control text-center" id="unit_water"
                                                       name="unit_hydra"
                                                       aria-describedby="qtd_water" placeholder="10" required>
                                            </div>
                                            <div class="form-group col-auto">
                                                <label class="" for="qtd_water">Quantidade (litros)</label>
                                                <input type="text" class="form-control text-center" id="qtd_water"
                                                       name="qtd_hydra"
                                                       aria-describedby="qtd_water" placeholder="4" required>
                                            </div>
                                        </form>
                                        <div class="card-footer card_footer_my_day">
                                            <button type="button" class="btn btn-sm">
                                                <i class="material-icons md20 icon_gray">add_circle_outline</i>
                                            </button>
                                            <button type="button" class="btn btn-sm">
                                                <i class="material-icons md20 icon_gray">remove_circle_outline</i>
                                            </button>
                                            <button type="submit" form="hydra-form" class="btn btn-success btn-sm">
                                                SALVAR
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </main>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<%--<script src="js/my_day.js"></script>--%>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/widgets/datepicker.js"></script>
<script src="js/updateDay.js"></script>

</body>
</html>


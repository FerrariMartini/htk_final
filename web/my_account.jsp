<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.entities_beans.User" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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

    <title>Health Track - Meus Dados</title>

</head>

<body>
<div class="container-fluid">
    <header>
        <%@include file="menu_interno.jsp" %>
    </header>

    <!--Sessão de form-->
    <main class="account_wrap">
        <% session.getAttribute("user"); %>
        <div class="container account_title">
            <div>
                <c:if test="${not empty sucess}">
                    <div class="alert alert-success text-center">${sucess}</div>
                </c:if>
                <c:if test="${not empty err}">
                    <div class="alert alert-danger text-center">${err}</div>
                </c:if>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="card account-card-container">
                <form id="user-form" action="MinhaConta" method="post">
                    <input type="hidden" class="hidden" value="userForm" name="formOption">
                    <div class="card-header">
                        MEUS DADOS
                    </div>
                    <div class="card-body">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="getFirstName">Nome</label>
                                <input type="text" class="form-control" id="getFirstName"
                                       value="${sessionScope.user.name}" disabled required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="getLastName">Sobrenome</label>
                                <input type="text" class="form-control" id="getLastName"
                                       value="${sessionScope.user.lastName}" disabled required>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="birthday">Data de Nascimento</label>
                                <input type="text" class="form-control" id="birthday"
                                    <% SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                     User loggedUser = (User) session.getAttribute("user");
                                     String dt = sdf.format(loggedUser.getBirthday().getTime());
                                     session.setAttribute("dt", dt);%>
                                       value="${sessionScope.dt}" disabled required>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="gender">Genero Biológico</label>
                                <select class="form-control" id="gender" disabled required>
                                    <option value="Masculino">${sessionScope.user.gender}</option>
                                    <option value="Feminino">${sessionScope.user.gender}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label for="getWeigth">Peso Inicial</label>
                                <input type="text" class="form-control" id="getWeigth"
                                       value="${sessionScope.user.initWeight}" disabled required>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="getHeight">Altura</label>
                                <input type="text" class="form-control" id="getHeight"
                                       value="${sessionScope.user.initHeight}" disabled required>
                            </div>
                            <div class="form-group col-md-4">
                                <label for="showIMC">IMC Inicial</label>
                                <input type="text" class="form-control" id="showIMC" disabled required
                                       value="${sessionScope.user.initIMC}">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="getPhone">Telefone/Celular</label>
                            <input type="tel" class="form-control" id="getPhone" name="userPhone"
                                   value="${sessionScope.user.phone}" required>
                            <small class="validStyle msg"></small>
                        </div>

                        <div class="form-group">
                            <label for="getUserEmail">E-mail</label>
                            <input type="email" class="form-control" id="getUserEmail" name="userEmail"
                                   value="${sessionScope.user.email}"
                                   required>
                            <small class="validStyle msg"></small>
                        </div>

                        <br>
                        <p>Tipo de Plano Atual</p>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="priceType" id="free"
                                   value="free" required>
                            <label class="form-check-label" for="free">
                                Gratuito - com restrição de funcionalidades
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="priceType" id="premium"
                                   value="premium" checked required>
                            <label class="form-check-label" for="premium">
                                Premium - completa por apenas R$ 4,99/mês.
                            </label>
                        </div>
                        <br>
                        <div class="container format_buttons">
                            <button form="user-form" type="submit" class="btn btn-warning">Alterar Usuário
                            </button>
                        </div>
                    </div>
                </form>
            </div>

            <div>
                <% session.getAttribute("ec"); %>
                <div class="card account-card-container">
                    <form id="ec-form" action="MinhaConta" method="post">
                        <input type="hidden" class="hidden" value="ecForm" name="formOption">
                        <div class="card-header">
                            DADOS DO CONTATO DE EMERGÊNCIA
                        </div>
                        <div class="card-body">
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="getFirstNameEmergency">Nome</label>
                                    <input type="text" class="form-control" id="getFirstNameEmergency" name="ecName"
                                           value="${sessionScope.ec.name}" required>
                                    <small class="validStyle msg"></small>
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="getLastNameEmergency">Sobrenome</label>
                                    <input type="text" class="form-control" id="getLastNameEmergency" name="ecLastName"
                                           value="${sessionScope.ec.lastName}" required>
                                    <small class="validStyle msg"></small>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="getKinship">Parentesco</label>
                                <select id="getKinship" class="custom-select" name="eckinship">
                                    <c:if test="${sessionScope.ec.kinship.equals('Filho/Filha')}">
                                        <option value="Filho/Filha">${sessionScope.ec.kinship}</option>
                                    </c:if>
                                    <option value="Filho/Filha">Filho/Filha</option>

                                    <c:if test="${sessionScope.ec.kinship.equals('Pai/Mãe')}">
                                        <option value="Pai/Mãe">${sessionScope.ec.kinship}</option>
                                    </c:if>
                                    <option value="Pai/Mãe">Pai/Mãe</option>

                                    <c:if test="${sessionScope.ec.kinship.equals('Cônjunge')}">
                                        <option value="Cônjunge">${sessionScope.ec.kinship}</option>
                                    </c:if>
                                    <option value="Cônjunge">Cônjunge</option>

                                    <c:if test="${sessionScope.ec.kinship.equals('Outros')}">
                                        <option value="Outros">${sessionScope.ec.kinship}</option>
                                    </c:if>
                                    <option value="Outros">Outros</option>

                                </select>
                            </div>

                            <div class="form-group">
                                <label for="getEmailEmergency">E-mail</label>
                                <input type="email" class="form-control" id="getEmailEmergency" name="ecEmail"
                                       value="${sessionScope.ec.email}" required>
                                <small class="validStyle msg"></small>
                            </div>
                            <div class="form-group">
                                <label for="getPhoneEmergency">Telefone/Celular</label>
                                <input type="tel" class="form-control" id="getPhoneEmergency" name="ecPhone"
                                       value="${sessionScope.ec.phone}" required>
                                <small class="validStyle msg"></small>
                            </div>
                            <div class="container format_buttons">
                                <button form="ec-form" type="submit" class="btn btn-warning">Alterar Contato</button>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="card account-card-container">
                    <form id="pwd-form" action="MinhaConta" method="post">
                        <input type="hidden" class="hidden" value="pwdForm" name="formOption">
                        <div class="card-header">
                            ALTERAR SENHA
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="getOldPwd">Senha Atual</label>
                                <input type="text" class="form-control" id="getOldPwd"
                                       value="${sessionScope.user.pwd}"
                                       required disabled>
                                <small id="pwdOldHelper" class="form-text text-muted">Senha com mínimo de 4
                                    caracteres
                                </small>
                                <small class="validStyle msg"></small>

                            </div>
                            <div class="form-group">
                                <label for="getNewPwd">Senha Nova</label>
                                <input type="text" class="form-control" id="getNewPwd"
                                       placeholder="Jsc98320Silva" name="newUserPWD"
                                       required>
                                <small id="pwdNewHelper" class="form-text text-muted">Senha com mínimo de 4
                                    caracteres
                                </small>
                                <small class="validStyle msg"></small>

                            </div>
                            <div class="container format_buttons">
                                <button type="submit" form="pwd-form" class="btn btn-warning">Alterar Senha
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/my_account.js"></script>
</body>
</html>


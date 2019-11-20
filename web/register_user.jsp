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

    <%@include file="header.jsp" %>
    <title>Health Track - Cadastro</title>

</head>
<body>
<div class="container-fluid">
    <header>
        <%@include file="menu_login_register.jsp" %>
    </header>

    <!--Sessão de formulário-->

    <main class="register_wrap">
        <div class="container register_title">
            <h1>Bem vindo ao<span class="logoHTK">&nbsp;Health Track</span></h1>
        </div>
        <c:if test="${not empty err}">
            <div class="alert alert-danger text-center">${err}</div>
        </c:if>
        <form action="Cadastrar" method="post">
            <div class="row justify-content-center">
                <div class="card register-card-container">
                    <div class="card-header">
                        PREENCHER COM MEUS DADOS
                    </div>
                    <div class="card-body">
                        <div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="getFirstName">Nome</label>
                                    <input type="text" class="form-control" id="getFirstName" name="name"
                                           placeholder="José"
                                           required>
                                    <small id="validFirstName" class="validStyle"></small>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="getLastName">Sobrenome</label>
                                    <input type="text" class="form-control" id="getLastName" name="lastName"
                                           placeholder="Lins da Silva" required>
                                    <small id="validLastName" class="validStyle"></small>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="birthday">Data de Nascimento</label>
                                    <input type="date" class="form-control" id="birthday" name="birthday">
                                </div>

                                <div class="form-group col-md-6">
                                    <label for="gender">Genero Biológico</label>
                                    <select class="form-control" id="gender" required name="gender">
                                        <option value="Masculino">Masculino</option>
                                        <option value="Feminino">Feminino</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="getWeigth">Peso Inicial</label>
                                    <input type="text" class="form-control" id="getWeigth" placeholder="89,9"
                                           name="weight">
                                    <small id="validWeigth" class="validStyle"></small>

                                </div>
                                <div class="form-group col-md-4">
                                    <label for="getHeight">Altura</label>
                                    <input type="text" class="form-control" id="getHeight" placeholder="1,90"
                                           name="height">
                                    <small id="validHeight" class="validStyle"></small>
                                </div>

                                <div class="form-group col-md-4">
                                    <label>IMC Inicial</label>
                                    <div id="showIMC" class="form-control" readonly></div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="getCPF">CPF</label>
                                <input type="text" class="form-control" id="getCPF"
                                       placeholder="22566723409" name="cpf">
                                <small id="validCPF" class="validStyle"></small>
                            </div>

                            <div class="form-group">
                                <label for="getPhone">Telefone/Celular</label>
                                <input type="text" class="form-control" id="getPhone"
                                       placeholder="(11) 95842-8900" name="phone">
                                <small id="validPhone" class="validStyle"></small>
                            </div>

                            <div class="form-group">
                                <label for="getEmail">E-mail</label>
                                <input type="email" class="form-control" id="getEmail"
                                       placeholder="josesilva@gmail.com" name="email">
                                <small id="validEmail" class="validStyle"></small>

                            </div>

                            <div class="form-group">
                                <label for="getPwd">Senha</label>
                                <input type="text" class="form-control" id="getPwd" placeholder="Jsc98320Silva"
                                       name="pwd">
                                <small id="pwdHelper" class="form-text text-muted">Senha com mínimo de 4 caracteres
                                </small>
                                <small id="validPwd" class="validStyle"></small>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="card register-card-container">
                        <div class="card-header">
                            DADOS DO CONTATO DE EMERGÊNCIA
                        </div>
                        <div class="card-body">
                            <div>
                                <div class="form-row">
                                    <div class="form-group col-sm-6">
                                        <label for="emeFirstName">Nome</label>
                                        <input type="text" class="form-control" id="emeFirstName"
                                               placeholder="Maria" name="emName">
                                        <small id="validEmeFirstName" class="validStyle"></small>
                                    </div>

                                    <div class="form-group col-sm-6">
                                        <label for="getLastNameEme">Sobrenome</label>
                                        <input type="text" class="form-control" id="getLastNameEme"
                                               placeholder="Lins da Silva" name="emLastName">
                                        <small id="validLastNameEm" class="validStyle"></small>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="getKinship">Parentesco</label>
                                    <select id="getKinship" class="custom-select" name="kinship" required>
                                        <option value="Filho/Filha">Filho/Filha</option>
                                        <option value="Pai/Mãe">Pai/Mãe</option>
                                        <option value="Cônjunge">Cônjunge</option>
                                        <option value="Outros">Outros</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="getEmailEmergency">E-mail</label>
                                    <input type="email" class="form-control" id="getEmailEmergency"
                                           placeholder="marias.oliveira@gmail.com" name="emEmail">
                                    <small id="validEmEmail" class="validStyle"></small>

                                </div>
                                <div class="form-group">
                                    <label for="getPhoneEmergency">Telefone/Celular</label>
                                    <input type="text" class="form-control" id="getPhoneEmergency"
                                           placeholder="(11) 95842-8900" name="emPhone">
                                    <small id="validEmPhone" class="validStyle"></small>

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card register-card-container">
                        <div class="card-header">
                            SELECIONAR O PLANO
                        </div>
                        <div class="card-body">
                            <div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="priceType" id="free"
                                           value="free" checked required>
                                    <label class="form-check-label" for="free">
                                        Gratuito - com restrição de funcionalidades
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="priceType" id="premium"
                                           value="premium" required>
                                    <label class="form-check-label" for="premium">
                                        Premium - completa por apenas R$ 4,99/mês.
                                    </label>
                                </div>
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="gridCheck" checked required>
                                        <label class="form-check-label" for="gridCheck">
                                            Concordo com os termos de serviço.
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="container format_buttons">
                                <a class="btn btn-danger" href="index.jsp">Cancelar</a>
                                <button type="submit" class="btn btn-success">Salvar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </main>
    <!--	Rodapé-->
    <footer class="nav navbar-expand navbar-light">
        <%@include file="footer_home.jsp" %>
    </footer>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/cpfValidation.js"></script>
<script src="js/register.js"></script>
<script src="js/initICM.js"></script>
</body>
</html>

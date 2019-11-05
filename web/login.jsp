<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 31/10/2019
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
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

    <!--usando biblioteca fontawesome-->
    <script src="https://kit.fontawesome.com/9299b2b589.js"></script>

    <!--Scripts JS-->
    <script src="js/login.js"></script>

    <!--refeenciando o Jquery-->
    <script src="js/jquery-3.4.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <title>Health Track - Login</title>

</head>

<body>
<div class="container-fluid">
    <header>
        <nav class="navbar navbar-expand-sm fixed-top navbar-light">

            <div class="container align-items-center justify-content-around">

                <div class="brand_container">
                    <a class="navbar-brand" href="index.jsp"><h2 class="logoHTK">Health Track</h2></a>
                </div>

                <div class="phone_container">
                    <i id="phoneIcon" class="fas fa-phone-alt icon_color md20 mt-2"></i>
                    <a class="nav-link" href="tel:3030-1234">3030-1234</a>
                </div>
            </div>
        </nav>
    </header>
    <!--Sessão de login-->
    <section class="row justify-content-center">
        <div class="card login_card">
            <div class="card-header">
                ACESSAR MEU HEALTH TRACK
            </div>
            <div class="card-body">
                <form action="Logar" method="post">
                    <div class="form-group">
                        <label for="getEmail">Email do Usuário</label>
                        <input type="email" class="form-control" id="getEmail" name="login"
                               aria-describedby="emailHelp" placeholder="Inserir email" required>
                        <small id="emailHelp" class="form-text text-muted">ex: jose@gmail.com</small>
                        <small id="validEmailMsg" class="validStyle"></small>
                    </div>
                    <div class="form-group">
                        <label for="getPassword">Insira sua senha</label>
                        <input type="password" class="form-control" id="getPassword" name="pwd"
                               aria-describedby="pwdHelp" placeholder="Senha com mínimo de 4 dígitos" required>
                        <small id="pwdHelp" class="form-text text-muted">ex: Jps325654</small>
                        <small id="validPwdMsg" class="validStyle"></small>
                    </div>
                    <button type="submit" class="btn btn-success btn-block">ACESSAR</button>
                </form>

                <a href="#" class="btn btn-link btn-sm col-12" role="button">Recuperar minha
                    Senha</a>

                <div class="card-footer">
                    <p class="text-muted">Não tenho uma conta ainda</p>
                    <a href="register_user.jsp" class="btn btn-outline-primary btn-md">FAZER UMA CONTA
                        GRATUITA</a>
                </div>
            </div>
        </div>
    </section>

    <!--Rodapé -->
    <footer class="nav navbar-expand navbar-light">
        <div class="container">
            <div class="row justify-content-around">

                <div class="col-auto">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Funcionalidades</a></li>
                    </ul>
                </div>

                <div class="col-auto">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Proteção de Dados</a></li>
                    </ul>
                </div>

                <div class="col-auto">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Quem Somos</a></li>
                    </ul>
                </div>

                <div class="col-auto">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Ajuda</a></li>
                    </ul>
                </div>


                <div class="col-auto">
                    <ul class="nav">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Preço</a></li>
                    </ul>
                </div>

                <div class="align-self-center ml-5">
                    <div>
                        <ul class="nav">
                            <li class="nav-item mr-2">
                                <a href=""> <img src="../imagem/fb3.png" class="image-mds" alt="facebook"></a>
                            </li>
                            <li class="nav-item ml-2">
                                <a href=""> <img src="../imagem/insta2.png" class="image-mds" alt="instagram"></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
</body>
</html>

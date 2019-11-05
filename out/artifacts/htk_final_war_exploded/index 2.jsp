<%--
  Created by IntelliJ IDEA.
  User: ivanferrarimartini
  Date: 31/10/2019
  Time: 18:50
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
    <link href="https://fonts.googleapis.com/css?family=Bellefair&display=swap" rel="stylesheet">

    <!-- referenciando o arquivo CSS customizado -->
    <link rel="stylesheet" href="css_customized/customizedAll.css" title="estilo principal">

    <!--refeenciando o Jquery-->
    <script src="js/jquery-3.4.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>

    <!--usando biblioteca fontawesome-->
    <script src="https://kit.fontawesome.com/9299b2b589.js"></script>

    <title>Health Track - Home</title>

</head>

<body>
<div class="container-fluid">
    <div class="bg_container">
        <header>
            <nav class="navbar navbar-expand-sm fixed-top navbar-light">

                <div class="container align-items-center">

                    <div class="brand_container">
                        <a class="navbar-brand" href="index.jsp"><h2 class="logoHTK">Health Track</h2></a>
                    </div>

                    <div class="phone_container">
                        <i id="phoneIcon" class="fas fa-phone-alt icon_color md20 mt-2"></i>
                        <a class="nav-link" href="tel:3030-1234">3030-1234</a>
                    </div>


                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#menu"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div id="menu" class="collapse navbar-collapse menu_container">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Planos</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="pages/register_user.jsp">Cadastrar</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="pages/login.jsp">Login</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!--Sessão principal-->
        <main>
            <div class="container home">
                <h1>Cuidando<br>da sua saúde.</h1>
                <div>
                    <a class="btn btn-primary btn-lg" href="pages/register_user.jsp" role="button">Usar
                        Gratuitamente</a>
                    <a id="botao" class="btn btn-success btn-lg" href="pages/register_user.jsp" role="button">Assinar
                        o
                        Premium</a>
                </div>
            </div>
        </main>

        <!--Rodapé-->
        <footer class="nav navbar-expand navbar-light">
            <div class="container">
                <div class="row justify-content-around">

                    <div class="flex-column">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Funcionalidades</a></li>
                        </ul>
                    </div>

                    <div class="flex-column">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Proteção de Dados</a></li>
                        </ul>
                    </div>

                    <div class="flex-column">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Quem Somos</a></li>
                        </ul>
                    </div>

                    <div class="flex-column">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Ajuda</a></li>
                        </ul>
                    </div>


                    <div class="flex-column">
                        <ul class="nav">
                            <li class="nav-item">
                                <a class="nav-link" href="#">Preço</a></li>
                        </ul>
                    </div>

                    <div class="flex-column align-self-center">
                        <div>
                            <ul class="nav">
                                <li class="nav-item mr-2">
                                    <a href=""> <img src="imagem/fb3.png" class="image-mds" alt="facebook"></a>
                                </li>
                                <li class="nav-item ml-2">
                                    <a href=""> <img src="imagem/insta2.png" class="image-mds" alt="instagram"></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
</body>
</html>

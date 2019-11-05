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

	<!--refeenciando o Jquery-->
	<script src="js/jquery-3.4.1.js"></script>
	<script src="js/register.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<!--usando biblioteca fontawesome-->
	<script src="https://kit.fontawesome.com/9299b2b589.js"></script>


	<title>Health Track - Cadastro</title>

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

	<!--Sessão de formulário-->

	<main class="register_wrap">

		<div class="container register_title">
			<h1>Bem vindo ao<span class="logoHTK">&nbsp;Health Track</span></h1>
		</div>

		<div class="row justify-content-center">
			<div class="card register-card-container">
				<div class="card-header">
					PREENCHER COM MEUS DADOS
				</div>
				<div class="card-body">
					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="getFirstName">Nome</label>
								<input type="text" class="form-control" id="getFirstName" placeholder="José" required>
								<small id="validFirstName" class="validStyle"></small>
							</div>
							<div class="form-group col-md-6">
								<label for="getLastName">Sobrenome</label>
								<input type="text" class="form-control" id="getLastName"
								       placeholder="Lins da Silva" required>
								<small id="validLastName" class="validStyle"></small>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="birthday">Data de Nascimento</label>
								<input type="date" class="form-control" id="birthday">
							</div>

							<div class="form-group col-md-6">
								<label for="gender">Genero Biológico</label>
								<select class="form-control" id="gender" required>
									<option>Masculino</option>
									<option>Feminino</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="getWeigth">Peso Inicial</label>
								<input type="text" class="form-control" id="getWeigth" placeholder="89,9">
								<small id="validWeigth" class="validStyle"></small>

							</div>
							<div class="form-group col-md-4">
								<label for="getHeight">Altura</label>
								<input type="text" class="form-control" id="getHeight" placeholder="1,90">
								<small id="validHeight" class="validStyle"></small>
							</div>

							<div class="form-group col-md-4">
								<label>IMC Inicial</label>
								<div id="showIMC" class="form-control"></div>
							</div>
						</div>

						<div class="form-group">
							<label for="getCPF">CPF</label>
							<input type="text" class="form-control" id="getCPF"
								   placeholder="22566723409">
							<small id="validCPF" class="validStyle"></small>
						</div>

						<div class="form-group">
							<label for="getPhone">Telefone/Celular</label>
							<input type="text" class="form-control" id="getPhone"
							       placeholder="(11) 95842-8900">
							<small id="validPhone" class="validStyle"></small>
						</div>

						<div class="form-group">
							<label for="getEmail">E-mail</label>
							<input type="email" class="form-control" id="getEmail"
							       placeholder="josesilva@gmail.com">
							<small id="validEmail" class="validStyle"></small>

						</div>

						<div class="form-group">
							<label for="getPwd">Senha</label>
							<input type="email" class="form-control" id="getPwd" placeholder="Jsc98320Silva">
							<small id="pwdHelper" class="form-text text-muted">Senha com mínimo de 4 caracteres
							</small>
							<small id="validPwd" class="validStyle"></small>
						</div>
					</form>
				</div>
			</div>

			<div>
				<div class="card register-card-container">
					<div class="card-header">
						DADOS DO CONTATO DE EMERGÊNCIA
					</div>
					<div class="card-body">
						<form>
							<div class="form-row">
								<div class="form-group col-sm-6">
									<label for="emeFirstName">Nome</label>
									<input type="text" class="form-control" id="emeFirstName"
									       placeholder="Maria">
									<small id="validEmeFirstName" class="validStyle"></small>
								</div>

								<div class="form-group col-sm-6">
									<label for="getLastNameEme">Sobrenome</label>
									<input type="text" class="form-control" id="getLastNameEme"
									       placeholder="Lins da Silva">
									<small id="validLastNameEm" class="validStyle"></small>
								</div>
							</div>
							<div class="form-group">
								<lable for="getKinship">Parentesco</lable>
								<select id="getKinship" class="custom-select" required>
									<option>Filho/Filha</option>
									<option>Pai/Mãe</option>
									<option>Cônjunge</option>
									<option>Outros</option>
								</select>
							</div>
							<div class="form-group">
								<label for="getEmailEmergency">E-mail</label>
								<input type="email" class="form-control" id="getEmailEmergency"
								       placeholder="marias.oliveira@gmail.com">
								<small id="validEmEmail" class="validStyle"></small>

							</div>
							<div class="form-group">
								<label for="getPhoneEmergency">Telefone/Celular</label>
								<input type="text" class="form-control" id="getPhoneEmergency"
								       placeholder="(11) 95842-8900">
								<small id="validEmPhone" class="validStyle"></small>

							</div>
						</form>
					</div>
				</div>

				<div class="card register-card-container">
					<div class="card-header">
						SELECIONAR O PLANO
					</div>
					<div class="card-body">
						<form>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="priceType" id="free"
								       value="option1" checked required>
								<label class="form-check-label" for="free">
									Gratuito - com restrição de funcionalidades
								</label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="priceType" id="premium"
								       value="option2" required>
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
							<div class="container format_buttons">
								<a class="btn btn-danger" href="index.jsp">Cancelar</a>
								<button type="submit" class="btn btn-success">Salvar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!--	Rodapé-->
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
</body>
</html>

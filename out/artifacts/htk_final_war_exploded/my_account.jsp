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

	<!--referenciando scripts-->
	<script src="js/jquery-3.4.1.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my_account.js"></script>

	<title>Health Track - Meus Dados</title>

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
								<a class="nav-link" href="my_day_page.jsp">Meu Dia</a>
							</li>

							<li class="nav-item">
								<a class="nav-link active" href="my_account.jsp">Meus Dados</a>
							</li>

							<li class="nav-item">
								<a class="nav-link" href="goals.jsp">Minhas Metas</a>
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

	<!--Sessão de form-->
	<main class="account_wrap">
		<div class="container account_title"></div>
		<div class="row justify-content-center">
			<div class="card account-card-container">
				<div class="card-header">
					MEUS DADOS
				</div>
				<div class="card-body">
					<form>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="getFirstName">Nome</label>
								<input type="text" class="form-control" id="getFirstName" placeholder="José" required
								       disabled>

							</div>
							<div class="form-group col-md-6">
								<label for="getLastName">Sobrenome</label>
								<input type="text" class="form-control" id="getLastName" placeholder="Lins da Silva"
								       required disabled>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="birthday">Data de Nascimento</label>
								<input type="date" class="form-control" id="birthday" required disabled>
							</div>

							<div class="form-group col-md-6">
								<label for="gender">Genero Biológico</label>
								<select class="form-control" id="gender" required disabled>
									<option>Masculino</option>
									<option>Feminino</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="getWeigth">Peso Inicial</label>
								<input type="text" class="form-control" id="getWeigth" placeholder="89,9" required
								       disabled>

							</div>
							<div class="form-group col-md-4">
								<label for="getHeight">Altura</label>
								<input type="text" class="form-control" id="getHeight" placeholder="1,90" required
								       disabled>
							</div>

							<div class="form-group col-md-4">
								<label for="showIMC">IMC Inicial</label>
								<input type="text" class="form-control" id="showIMC" placeholder="25,6" required
								       disabled>
							</div>
						</div>

						<div class="form-group">
							<label for="getPhone">Telefone/Celular</label>
							<input type="tel" class="form-control" id="getPhone"
							       placeholder="(11) 95842-8900" required disabled>
							<small class="validStyle msg"></small>
						</div>

						<div class="form-group">
							<label for="getUserEmail">E-mail</label>
							<input type="email" class="form-control" id="getUserEmail" placeholder="josesilva@gmail.com"
							       required disabled>
							<small class="validStyle msg"></small>
						</div>

						<br>
						<p>Tipo de Plano Atual</p>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="priceType" id="free"
							       value="option1" disabled>
							<label class="form-check-label" for="free">
								Gratuito - com restrição de funcionalidades
							</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="priceType" id="premium"
							       value="option2" checked disabled>
							<label class="form-check-label" for="premium">
								Premium - completa por apenas R$ 4,99/mês.
							</label>
						</div>
						<br>
						<div class="container format_buttons">
							<button id="update_user" type="button" class="btn btn-warning">Alterar</button>
							<button type="submit" class="btn btn-success">Salvar</button>
						</div>
					</form>
				</div>
			</div>

			<div>
				<div class="card account-card-container">
					<div class="card-header">
						DADOS DO CONTATO DE EMERGÊNCIA
					</div>
					<div class="card-body">
						<form>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="getFirstNameEmergency">Nome</label>
									<input type="text" class="form-control" id="getFirstNameEmergency"
									       placeholder="Maria" required disabled>
									<small class="validStyle msg"></small>
								</div>

								<div class="form-group col-md-6">
									<label for="getLastNameEmergency">Sobrenome</label>
									<input type="text" class="form-control" id="getLastNameEmergency"
									       placeholder="Lins da Silva" required disabled>
									<small class="validStyle msg"></small>
								</div>
							</div>
							<div class="form-group">
								<lable for="getKinship">Parentesco</lable>
								<select id="getKinship" class="custom-select" required disabled>
									<option>Filho/Filha</option>
									<option>Pai/Mãe</option>
									<option>Cônjunge</option>
									<option>Outros</option>
								</select>
							</div>

							<div class="form-group">
								<label for="getEmailEmergency">E-mail</label>
								<input type="email" class="form-control" id="getEmailEmergency"
								       placeholder="marias.oliveira@gmail.com" required disabled>
								<small class="validStyle msg"></small>
							</div>


							<div class="form-group">
								<label for="getPhoneEmergency">Telefone/Celular</label>
								<input type="tel" class="form-control" id="getPhoneEmergency"
								       placeholder="(11)95842-8900" required disabled>
								<small class="validStyle msg"></small>
							</div>
							<div class="container format_buttons">
								<button id="update_emer" type="button" class="btn btn-warning">Alterar</button>
								<button type="button" class="btn btn-success">Salvar</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card account-card-container">
					<div class="card-header">
						ALTERAR SENHA
					</div>
					<div class="card-body">
						<form>
							<div class="form-group">
								<label for="getOldPwd">Senha Atual</label>
								<input type="email" class="form-control" id="getOldPwd" placeholder="Jsc98320Silva"
								       required disabled>
								<small id="pwdOldHelper" class="form-text text-muted">Senha com mínimo de 4 caracteres
								</small>
								<small class="validStyle msg"></small>

							</div>
							<div class="form-group">
								<label for="getNewPwd">Senha Nova</label>
								<input type="email" class="form-control" id="getNewPwd" placeholder="Jsc98320Silva"
								       required disabled>
								<small id="pwdNewHelper" class="form-text text-muted">Senha com mínimo de 4 caracteres
								</small>
								<small class="validStyle msg"></small>

							</div>
							<div class="container format_buttons">
								<button id="update_pwd" type="button" class="btn btn-warning mr-0">Alterar</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
</body>
</html>

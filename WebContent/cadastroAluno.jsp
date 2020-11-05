<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Alunos</title>
</head>
<body>
<jsp:include page="cabecalhoALuno.jsp"></jsp:include>
<br>
<h2>Cadstro de Alunos</h2>
<br>
	<form action="SalvaAluno.jsp" method="post">
		<label>Nome: </label>
		<input type="text" name="nome"/>
		<label>ID da turma: </label>
		<input type="text" name="turID"/>
		<input type="submit" value="CADASTRAR"/>
	</form>
</body>
</html>
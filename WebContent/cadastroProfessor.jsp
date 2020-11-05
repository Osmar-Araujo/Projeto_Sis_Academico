<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Professores</title>
</head>
<jsp:include page="cabecalhoProfessor.jsp"></jsp:include>
<br>
<h2>Cadastro de Professores</h2>
<br>
<body>
	<form action="SalvaProfessor.jsp" method="post">
		<label>Nome: </label>
		<input type="text" name="prof_nome"/>
		<label>Titulação: </label>
		<input type="text" name="prof_titulacao"/>
		<input type="submit" value="CADASTRAR"/>
	</form>
</body>
</html>
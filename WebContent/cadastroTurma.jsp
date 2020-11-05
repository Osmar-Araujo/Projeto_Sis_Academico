<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>
<jsp:include page="cabecalhoTurma.jsp"></jsp:include>
<br>
<h2>Cadastro de Turmas</h2>
	<form action="SalvaTurma.jsp" method="post">
		<label>Descrição: </label>
		<input type="text" name="turDesc"/>
		<label>ID do curso: </label>
		<input type="text" name="idCur"/>
		<input type="submit" value="CADASTRAR"/>
	</form>
</body>
</html>
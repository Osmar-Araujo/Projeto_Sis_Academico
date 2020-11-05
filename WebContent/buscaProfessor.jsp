<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Registro</title>
</head>
<body>
	<jsp:include page="cabecalhoProfessor.jsp"></jsp:include>
	<br>
	<br>
<body>
	<form action="alterarProfessor.jsp" method="post">
		<label>Nome: </label>
		<input type="text" name="idProf" value="<%=request.getParameter("idprof") %>"/>
		<label>Nome: </label>
		<input type="text" name="profNome" value="<%=request.getParameter("nome") %>"/>
		<label>Titulação: </label>
		<input type="text" name="profTitula" value= "<%=request.getParameter("protitula") %>"/>
		<input type="submit" value="SALVAR"/>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Registro</title>
</head>
<body>
<jsp:include page="cabecalhoTurma.jsp"></jsp:include>
<br>
<br>
	<form action="alterarTurma.jsp" method="post">
		<label>ID: </label>
		<input type="text" name="IDTur" value="<%= request.getParameter("idTur") %>"/>
		<label>Descrição: </label>
		<input type="text" name="tur_Desc" value = "<%= request.getParameter("desc") %>"/>
		<label>ID do curso: </label>
		<input type="text" name="IDCur" value = "<%= request.getParameter("idCurso") %>"/>
		<input type="submit" value="SALVAR"/>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "beans.Aluno"
    import = "conexao.Conexao"
    import = "dao.alunoDao"
    import ="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Registro</title>
</head>
<body>
<jsp:include page="cabecalhoALuno.jsp"></jsp:include>
<br>
<h2>Alterar o Registro de um Aluno</h2>
<br>
	<form action="alterarAluno.jsp" method="post">
		<label>ID: </label>
		<input type="text" name="alu_id" value= "<%=request.getParameter("idaluno")%>">
		<label>Nome: </label>
		<input type="text" name="alu_nome" value= "<%=request.getParameter("nome")%>">
		<label>ID da turma: </label>
		<input type="text" name="id_alu_tur" value = "<%=request.getParameter("alu_tID") %>">
		<input type="submit" value="SALVAR">
	</form>
</body>
</html>
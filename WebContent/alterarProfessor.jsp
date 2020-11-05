<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="beans.Professor"
    import= "dao.professorDao"
    import= "conexao.Conexao"
    import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração Realizada com Sucesso!</title>
</head>
<body>
	<jsp:include page="cabecalhoProfessor.jsp"></jsp:include>
    <br>
    <h2>Operação Realizada com Sucesso!</h2>
	<br>
<%
	String nomeProf = request.getParameter("profNome");
	String ProfTitulacao = request.getParameter("profTitula");
	Integer IDProf = Integer.parseInt(request.getParameter("idProf"));
	
	Professor prof = new Professor();
	
	prof.setPro_nome(nomeProf);
	prof.setPro_titulacao(ProfTitulacao);
	prof.setPro_identificador(IDProf);
	
	professorDao profDao = new professorDao();
	profDao.alterarProfessor(prof);
%>
<%= "Registro Alterardo com Sucesso" %>
</body>
</html>
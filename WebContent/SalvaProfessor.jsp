<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "beans.Professor"
    import = "dao.professorDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro realizado com sucesso!</title>
</head>
<body>
	<br>
	<jsp:include page="cabecalhoProfessor.jsp"></jsp:include>
	<br>
	<h2>Operação Realizada com sucesso!</h2>
	<br>
	<%
		String sProfNome = request.getParameter("prof_nome");
		String sProfTitula = request.getParameter("prof_titulacao");
		
		Professor prof = new Professor();
		prof.setPro_nome(sProfNome);
		prof.setPro_titulacao(sProfTitula);
		
		professorDao profDao = new professorDao();
		profDao.cadastroProfessor(prof);
	%>
	<h3>Professor Cadastrado.</h3>	
</body>
</html>
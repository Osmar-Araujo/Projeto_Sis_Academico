<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "beans.Curso"
    import= "dao.cursoDao"
    import= "conexao.Conexao"
    import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alteração realizada com sucesso!</title>
</head>
<body>
<jsp:include page="cabecalhoCurso.jsp"></jsp:include>
<h2>Operação Realizada com Sucesso!</h2>
<br>
<%
	String curNome = request.getParameter("curnome");
	String curPeriodo = request.getParameter("curperiodo");
	String curDesc = request.getParameter("curdescricao");
	Integer curID = Integer.parseInt(request.getParameter("idcurso"));

	Curso cur = new Curso();
	cur.setCur_nome(curNome);
	cur.setCur_periodo(curPeriodo);
	cur.setCur_descricao(curDesc);
	cur.setCur_identificador(curID);

	cursoDao curDao = new cursoDao();
	curDao.alterarCurso(cur);
%>
<%= "Registro do Curso alterado."%>
</body>
</html>
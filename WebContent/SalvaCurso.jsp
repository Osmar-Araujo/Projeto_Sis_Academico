<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import= "beans.Curso"
    import= "dao.cursoDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Salvo com sucesso!</title>
</head>
<body>
<jsp:include page="cabecalhoCurso.jsp"></jsp:include>
<br>
<h2>Operação Realizada com Sucesso!</h2>
<br>
<%
String sCurNome = request.getParameter("cur_nome");
String sCurPeriodo = request.getParameter("cur_periodo");
String sCurDescricao = request.getParameter("cur_descricao");

Curso curso = new Curso();
curso.setCur_nome(sCurNome);
curso.setCur_periodo(sCurPeriodo);
curso.setCur_descricao(sCurDescricao);

cursoDao curDao = new cursoDao();
curDao.cadastroCurso(curso);
%>
<br>
<h3>Curso cadastrado!</h3>
</body>
</html>
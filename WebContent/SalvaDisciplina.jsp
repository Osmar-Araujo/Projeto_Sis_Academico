<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "beans.Disciplina"
    import= "dao.disciplinaDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dsiciplina Cadastrada com sucesso!</title>
</head>
<body>
<br>
<jsp:include page="cabecalhoDisciplina.jsp"></jsp:include>
<br>
<h2>Operação Realizada com sucesso!</h2>
<br>
<%
	String sDisNome = request.getParameter("disNome");
	String sDisCargaH = request.getParameter("disCargaH");
	String sDisEmenta = request.getParameter("disEmenta");
	Integer iIDCurso = Integer.parseInt(request.getParameter("IDCurso"));
	Integer iIDProf = Integer.parseInt(request.getParameter("IDProf"));
	
	Disciplina disc = new Disciplina();
	disc.setDis_nome(sDisNome);
	disc.setDis_carga_horaria(sDisCargaH);
	disc.setDis_ementa(sDisEmenta);
	disc.setDis_cur_identificador(iIDCurso);
	disc.setDis_pro_identificador(iIDProf);
	
	disciplinaDao disDao = new disciplinaDao();
	disDao.cadastroDisciplina(disc);
%>
<br>
<h3>Disciplina cadastrada.</h3>
</body>
</html>
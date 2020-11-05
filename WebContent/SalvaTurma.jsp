<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import ="beans.Turma"
    import = "dao.turmaDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cadastro Realizado com Sucesso!</title>
</head>
<body>
	<jsp:include page="cabecalhoTurma.jsp"></jsp:include>
	<br>
	<h2>Operação Realizada com Sucesso!</h2>
	<br>
	<%
		String TurDesc = request.getParameter("turDesc");
		Integer TurIdCurso = Integer.parseInt(request.getParameter("idCur"));
		
		Turma tur = new Turma();
		tur.setTur_descricao(TurDesc);
		tur.setTur_cur_identificador(TurIdCurso);
		
		turmaDao turDao = new turmaDao();
		turDao.cadastrarTurma(tur);
	%>
	<h3>Turma Cadastrada.</h3>
</body>
</html>
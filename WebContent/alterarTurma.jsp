<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="beans.Turma"
    import= "dao.turmaDao"
    import= "conexao.Conexao"
    import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro Alterado com sucesso!</title>
</head>
<body>
<jsp:include page="cabecalhoTurma.jsp"></jsp:include>
<br>
<h2>Operação Realizada com Sucesso!</h2>
<br>
<%
	Integer turID = Integer.parseInt(request.getParameter("IDTur"));
	String Turdesc = request.getParameter("tur_Desc");
	Integer Cur_ID = Integer.parseInt(request.getParameter("IDCur"));
	
	Turma tur = new Turma();
	
	tur.setTur_descricao(Turdesc);
	tur.setTur_cur_identificador(Cur_ID);
	tur.setTur_identificador(turID);
	
	turmaDao turDao = new turmaDao();
	turDao.alterarTurma(tur);
%>
<%= "Registro Alterardo com Sucesso" %>
</body>
</html>
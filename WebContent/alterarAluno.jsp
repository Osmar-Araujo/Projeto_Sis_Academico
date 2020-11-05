<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "beans.Aluno"
    import= "dao.alunoDao"
    import= "conexao.Conexao"
    import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração realizada com sucesso!</title>
</head>
<body>
<jsp:include page="cabecalhoALuno.jsp"></jsp:include>
<br>
<h2>Operação Realizada com sucesso!</h2>
<br>
<% 
	String salunome = request.getParameter("alu_nome");
	Integer turIdentificador = Integer.parseInt(request.getParameter("id_alu_tur"));
	Integer ID_alu = Integer.parseInt(request.getParameter("alu_id"));
	
	Aluno alu = new Aluno();
	alu.setAlu_nome(salunome);
	alu.setAlu_tur_identificador(turIdentificador);
	alu.setAlu_identificador(ID_alu);
	
	alunoDao aluDao = new alunoDao();
	aluDao.alterarAluno(alu);
%>
<%= "Registro do Aluno alterado."%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "beans.Aluno"
    import= "dao.alunoDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro realizado com sucesso!</title>
</head>
<body>
<jsp:include page="cabecalhoALuno.jsp"></jsp:include>
<br>
<h2>Operação Realizada com Sucesso!</h2>
<%
String snome = request.getParameter("nome");
Integer turIdentificador = Integer.parseInt(request.getParameter("turID"));

Aluno alu = new Aluno();
alu.setAlu_nome(snome);
alu.setAlu_tur_identificador(turIdentificador);

alunoDao aluDao = new alunoDao();
aluDao.cadastroAluno(alu);
%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listando Alunos</title>
</head>
<body>
<jsp:include page="cabecalhoALuno.jsp"></jsp:include>
<br>
<%@ page language="java" import = "java.util.List"
						 import = "java.util.ArrayList"
						 import= "beans.Aluno"
						 import = "java.sql.*"
						 import = "conexao.Conexao"%>
<%
String sql = "select * from public.alunos order by alu_tur_identificador";
List<Aluno> lista = new ArrayList<Aluno>();

try {
	Connection con = Conexao.getConnetion();
	PreparedStatement preparador = con.prepareStatement(sql);
	ResultSet resultados = preparador.executeQuery();
	while(resultados.next()) {
		Aluno aluno = new Aluno();
		aluno.setAlu_identificador(resultados.getInt("alu_identificador"));
		aluno.setAlu_nome(resultados.getString("alu_nome"));
		aluno.setAlu_tur_identificador(resultados.getInt("alu_tur_identificador"));
		lista.add(aluno);
	}
} catch (SQLException e) {
	out.println("Erro ao listar alunos - " + e.getLocalizedMessage());
}
%>
<br>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID</th>
	<th>Nome</th>
	<th>ID turma</th>
	<th>Excluir</th>
	<th>Editar</th>
</tr>
<% 
for(Aluno a:lista) {
%>
<tr>
	<th><%=a.getAlu_identificador() %></th>
	<th><%=a.getAlu_nome() %></th>
	<th><%=a.getAlu_tur_identificador() %></th>
	<th><a href="deletaAluno.jsp?idaluno=<%=a.getAlu_identificador()%>">Excluir</a></th>
	<th><a href="buscaAluno.jsp?idaluno=<%=a.getAlu_identificador()%>&nome=<%=a.getAlu_nome()%>&alu_tID=<%=a.getAlu_tur_identificador() %>">Editar</a></th>
	
</tr>
<%
}
%>
</table>
</body>
</html>
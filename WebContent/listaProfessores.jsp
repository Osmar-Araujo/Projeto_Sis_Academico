<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar Professores</title>
</head>
<body>
	<jsp:include page="cabecalhoProfessor.jsp"></jsp:include>
	<br>
<%@ page language="java" import = "java.util.List"
						 import = "java.util.ArrayList"
						 import= "beans.Professor"
						 import = "java.sql.*"
						 import = "conexao.Conexao"%>
<%
String sql = "select * from public.professores order by pro_nome";
List<Professor> lista = new ArrayList<Professor>();

try {
	Connection con = Conexao.getConnetion();
	PreparedStatement preparador = con.prepareStatement(sql);
	ResultSet resultados = preparador.executeQuery();
	while(resultados.next()) {
		Professor prof = new Professor();
		prof.setPro_identificador(resultados.getInt("pro_identificador"));
		prof.setPro_nome(resultados.getString("pro_nome"));
		prof.setPro_titulacao(resultados.getString("pro_titulacao"));
		lista.add(prof);
	}
} catch (SQLException e) {
	out.println("Erro ao listar Professores - " + e.getLocalizedMessage());
}
%>
<br>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID</th>
	<th>Nome</th>
	<th>Titulação</th>
	<th>Excluir</th>
	<th>Editar</th>
</tr>
<% 
for(Professor p:lista) {
%>
<tr>
	<th><%=p.getPro_identificador() %></th>
	<th><%=p.getPro_nome() %></th>
	<th><%=p.getPro_titulacao() %></th>
	<th><a href="deletaProfessor.jsp?idprof=<%=p.getPro_identificador() %>">Excluir</a></th>
	<th><a href="buscaProfessor.jsp?idprof=<%=p.getPro_identificador() %>&nome=<%=p.getPro_nome() %>&protitula=<%=p.getPro_titulacao() %>">Editar</a></th>
</tr>
<%
}
%>
</table>
</body>
</html>
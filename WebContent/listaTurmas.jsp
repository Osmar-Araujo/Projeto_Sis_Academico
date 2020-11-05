<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF=8">
<title>Listar Turmas</title>
</head>
<body>
	<jsp:include page="cabecalhoTurma.jsp"></jsp:include>
	<br>
<%@ page language="java" import = "java.util.List"
						 import = "java.util.ArrayList"
						 import= "beans.Turma"
						 import = "java.sql.*"
						 import = "conexao.Conexao"%>
<%
String sql = "select * from public.turmas order by tur_identificador";
List<Turma> lista = new ArrayList<Turma>();

try {
	Connection con = Conexao.getConnetion();
	PreparedStatement preparador = con.prepareStatement(sql);
	ResultSet resultados = preparador.executeQuery();
	while(resultados.next()) {
		Turma tur = new Turma();
		tur.setTur_identificador(resultados.getInt("tur_identificador"));
		tur.setTur_cur_identificador(resultados.getInt("tur_cur_identificador"));
		tur.setTur_descricao(resultados.getString("tur_descricao"));
		
		
		lista.add(tur);
	}
} catch (SQLException e) {
	out.println("Erro ao listar turmas - " + e.getLocalizedMessage());
}
%>
<br>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID</th>
	<th>Descrição</th>
	<th>ID do Curso</th>
	<th>Excluir</th>
	<th>Editar</th>
</tr>
<% 
for(Turma t:lista) {
%>
<tr>
	<th><%=t.getTur_identificador() %></th>
	<th><%=t.getTur_descricao() %></th>
	<th><%=t.getTur_cur_identificador() %></th>
	<th><a href="deletaTurma.jsp?idTur=<%=t.getTur_identificador() %>">Excluir</a></th>
	<th><a href="buscaTurma.jsp?idTur=<%=t.getTur_identificador() %>&desc=<%=t.getTur_descricao() %>&idCurso=<%=t.getTur_cur_identificador() %>">Editar</a></th>
</tr>
<%
}
%>
</table>

</body>
</html>
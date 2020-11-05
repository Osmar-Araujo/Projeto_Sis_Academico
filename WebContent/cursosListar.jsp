<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.List"
	import = "java.util.ArrayList"
	import = "java.sql.*"
	import = "beans.Curso"					 
	import = "conexao.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cursos</title>
</head>
<body>
<jsp:include page="paginaPrincipalRelatorios.jsp"></jsp:include>
<br>
<h3>Cursos Oferecidos pela Paideia:</h3>
<%
String sql = "select * from public.cursos order by cur_identificador";
List<Curso> listaCursos = new ArrayList<Curso>();

try{
	Connection con = Conexao.getConnetion();
	PreparedStatement preparador = con.prepareStatement(sql);
	ResultSet resultados = preparador.executeQuery();
	while(resultados.next()){
		Curso cur = new Curso();
		cur.setCur_identificador(resultados.getInt("cur_identificador"));
		cur.setCur_nome(resultados.getString("cur_nome"));
		cur.setCur_periodo(resultados.getString("cur_periodo"));
		cur.setCur_descricao(resultados.getString("cur_descricao"));
		listaCursos.add(cur);
	}
}catch(SQLException e){
	out.println("Erro ao listar cursos! " + e.getLocalizedMessage());
}
%>

<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID</th>
	<th>Curso</th>
	<th>Período</th>
	<th>Descrição</th>
</tr>
<%for(Curso c:listaCursos){ %>
<tr>
	<th><%=c.getCur_identificador() %></th>
	<th><%=c.getCur_nome() %></th>
	<th><%=c.getCur_periodo() %></th>
	<th><%=c.getCur_descricao() %></th>
</tr>
<% } %>
</table>
</body>
</html>
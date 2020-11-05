<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "beans.Curso"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listando os cursos</title>
</head>
<body>
<%@ page language="java" import = "java.util.List"
						 import = "java.util.ArrayList"
						 import = "java.sql.*"
						 
						 import = "conexao.Conexao"%>
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
<jsp:include page="cabecalhoCurso.jsp"></jsp:include>
<br>
<br>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID</th>
	<th>Curso</th>
	<th>Período</th>
	<th>Descrição</th>
	<th>Excluir</th>
	<th>Editar</th>
</tr>
<%for(Curso c:listaCursos){ %>
<tr>
	<th><%=c.getCur_identificador() %></th>
	<th><%=c.getCur_nome() %></th>
	<th><%=c.getCur_periodo() %></th>
	<th><%=c.getCur_descricao() %></th>
	<th><a href="deletaCurso.jsp?idcurso=<%=c.getCur_identificador() %>">Excluir</a></th>
	<th><a href="buscaCurso.jsp?id_curso=<%=c.getCur_identificador() %>&cur_nome=<%=c.getCur_nome() %>&cur_periodo=<%=c.getCur_periodo() %>&cur_desc=<%=c.getCur_descricao() %>">Editar</a></th>
</tr>
<% } %>
</table>
</body>
</html>
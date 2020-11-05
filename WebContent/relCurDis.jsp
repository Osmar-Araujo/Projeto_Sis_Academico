<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.List"
	import = "java.util.ArrayList"
	import = "java.sql.*"
	import = "beans.RelCurDis"				 
	import = "conexao.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Relação de Cursos e Disciplinas</title>
</head>
<body>
<jsp:include page="paginaPrincipalRelatorios.jsp"></jsp:include>
<br>
<h3>Relação de Cursos e Disciplinas:</h3>
<%
	String sql = "select cur_identificador, cur_nome, dis_identificador, dis_nome from public.disciplinas inner join public.cursos on dis_cur_identificador = cur_identificador	order by cursos.cur_identificador";
	List<RelCurDis> listaCurDis = new ArrayList<RelCurDis>();
	try{
		Connection con = Conexao.getConnetion();
		PreparedStatement preparador = con.prepareStatement(sql);
		ResultSet resultados = preparador.executeQuery();
		while(resultados.next()){
			RelCurDis rel = new RelCurDis();
			rel.setCur_identificador(resultados.getInt("cur_identificador"));
			rel.setCur_nome(resultados.getString("cur_nome"));
			rel.setDis_identificador(resultados.getInt("dis_identificador"));
			rel.setDis_nome(resultados.getString("dis_nome"));
			listaCurDis.add(rel);
		}
	}catch(SQLException e){
		out.println("Erro ao listar Curos e Disciplinas!" + e.getLocalizedMessage());
	}
%>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID do Curso</th>
	<th>Curso</th>
	<th>Disciplina</th>
	<th>ID da Disciplina</th>
</tr>
<%for(RelCurDis r:listaCurDis){ %>
<tr>
	<th><%=r.getCur_identificador() %></th>
	<th><%=r.getCur_nome() %></th>
	<th><%=r.getDis_nome() %></th>
	<th><%=r.getDis_identificador() %></th>
</tr>
<% } %>
</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listando as Disciplinas</title>
</head>
<body>
<%@ page language="java" import = "java.util.List"
						 import = "java.util.ArrayList"
						 import= "beans.Disciplina"
						 import = "java.sql.*"
						 import = "conexao.Conexao"%>
<% 
	String sql = "select * from public.disciplinas order by dis_identificador";
	List<Disciplina> listaDisciplinas = new ArrayList<Disciplina>();
	
	try{
		Connection con = Conexao.getConnetion();
		PreparedStatement preparador = con.prepareStatement(sql);
		ResultSet resultados = preparador.executeQuery();
		while(resultados.next()){
			Disciplina dis = new Disciplina();
			dis.setDis_identificador(resultados.getInt("dis_identificador"));
			dis.setDis_nome(resultados.getString("dis_nome"));
			dis.setDis_carga_horaria(resultados.getString("dis_carga_horaria"));
			dis.setDis_cur_identificador(resultados.getInt("dis_cur_identificador"));
			dis.setDis_pro_identificador(resultados.getInt("dis_pro_identificador"));
			dis.setDis_ementa(resultados.getString("dis_ementa"));
			listaDisciplinas.add(dis);
		}
	}catch(SQLException e){
		out.println("Erro ao listar Disciplinas! " + e.getLocalizedMessage());
	}
%>
	<jsp:include page="cabecalhoDisciplina.jsp"></jsp:include>
	<br>
	<br>
	<table border="1">
	<tr bgcolor="#eaeaea">
		<th>ID</th>
		<th>Disciplina</th>
		<th>Carga Horária</th>
		<th>ID do Curso</th>
		<th>ID do Professor</th>
		<th>Ementa</th>
		<th>Excluir</th>
		<th>Editar</th>
	</tr>
	<%for(Disciplina d:listaDisciplinas){ %>
	<tr>
		<th><%=d.getDis_identificador() %></th>
		<th><%=d.getDis_nome() %></th>
		<th><%=d.getDis_carga_horaria() %></th>
		<th><%=d.getDis_cur_identificador() %></th>
		<th><%=d.getDis_pro_identificador() %></th>
		<th><%=d.getDis_ementa() %>
		<th><a href="deletaDisciplina.jsp?iddisciplina=<%=d.getDis_identificador() %>">Excluir</a></th>
		<th><a href="buscaDisciplina.jsp?id_disc=<%= d.getDis_identificador() %>&dis_nome=<%=d.getDis_nome() %>
		&dis_cargah=<%=d.getDis_carga_horaria() %>&id_curso=<%=d.getDis_cur_identificador() %>
		&id_prof=<%=d.getDis_pro_identificador() %>&dis_ementa=<%=d.getDis_ementa() %>">Editar</a></th>
	</tr>
	<% } %>
	</table>
</body>
</html>
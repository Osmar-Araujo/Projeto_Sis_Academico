<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.List"
	import = "java.util.ArrayList"
	import = "java.sql.*"
	import = "beans.RelTurCur"				 
	import = "conexao.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Relação de Turmas por Curso:</title>
</head>
<body>
<jsp:include page="paginaPrincipalRelatorios.jsp"></jsp:include>
<br>
<h3>Relação de Turmas por Cursos:</h3>
<%
	String sql = "select cur_identificador, cur_nome, tur_identificador, tur_descricao from public.turmas inner join public.cursos on tur_cur_identificador = cur_identificador order by cursos.cur_identificador";
	List<RelTurCur> listaTurCur = new ArrayList<RelTurCur>();
	try{
		Connection con = Conexao.getConnetion();
		PreparedStatement preparador = con.prepareStatement(sql);
		ResultSet resultados = preparador.executeQuery();
		while(resultados.next()){
			RelTurCur rtc = new RelTurCur();
			rtc.setCur_identificador(resultados.getInt("cur_identificador"));
			rtc.setCur_nome(resultados.getString("cur_nome"));
			rtc.setTur_identificador(resultados.getInt("tur_identificador"));
			rtc.setTur_descricao(resultados.getString("tur_descricao"));
			listaTurCur.add(rtc);
		}
	}catch(SQLException e){
		out.println("Erro ao listar Turmas e Cursos!" + e.getLocalizedMessage());
	}
%>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID do Curso</th>
	<th>Curso</th>
	<th>Turma</th>
	<th>ID da Turma</th>
</tr>
<%for(RelTurCur r:listaTurCur){ %>
<tr>
	<th><%=r.getCur_identificador() %></th>
	<th><%=r.getCur_nome() %></th>
	<th><%=r.getTur_descricao() %></th>
	<th><%=r.getTur_identificador() %></th>
</tr>
<% } %>
</table>
</body>
</html>
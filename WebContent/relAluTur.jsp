<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.util.List"
	import = "java.util.ArrayList"
	import = "java.sql.*"
	import = "beans.RelAluTur"				 
	import = "conexao.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Relação de Alunos por Turmas</title>
</head>
<body>
<jsp:include page="paginaPrincipalRelatorios.jsp"></jsp:include>
<br>
<h3>Relação de Alunos por Turmas:</h3>
<%
	String sql = "select alu_identificador, alu_nome, tur_identificador, tur_descricao from public.alunos inner join public.turmas on alu_tur_identificador = tur_identificador order by turmas.tur_identificador,alunos.alu_nome;";
	List<RelAluTur> listaAluTur = new ArrayList<RelAluTur>();
	try{
		Connection con = Conexao.getConnetion();
		PreparedStatement preparador = con.prepareStatement(sql);
		ResultSet resultados = preparador.executeQuery();
		while(resultados.next()){
			RelAluTur rat = new RelAluTur();
			rat.setAlu_identificador(resultados.getInt("alu_identificador"));
			rat.setAlu_nome(resultados.getString("alu_nome"));
			rat.setTur_identificador(resultados.getInt("tur_identificador"));
			rat.setTur_descricao(resultados.getString("tur_descricao"));
			listaAluTur.add(rat);
		}
	}catch(SQLException e){
		out.println("Erro ao listar Alunos e Turmas!" + e.getLocalizedMessage());
	}
%>
<table border="1">
<tr bgcolor="#eaeaea">
	<th>ID do Curso</th>
	<th>Curso</th>
	<th>Turma</th>
	<th>ID da Turma</th>
</tr>
<%for(RelAluTur r:listaAluTur){ %>
<tr>
	<th><%=r.getAlu_identificador() %></th>
	<th><%=r.getAlu_nome() %></th>
	<th><%=r.getTur_descricao() %></th>
	<th><%=r.getTur_identificador() %></th>
</tr>
<% } %>
</table>
%>
</body>
</html>
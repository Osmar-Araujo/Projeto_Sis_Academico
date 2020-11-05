<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.sql.*"
    import = "conexao.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exclusão de Registro</title>
</head>
<body>
	<jsp:include page="cabecalhoTurma.jsp"></jsp:include>
	<br>
	<h2>Operação Realizada com Sucesso!</h2>
	<br>
	<%
		Integer IDtur = Integer.parseInt(request.getParameter("idTur"));
		Connection con = Conexao.getConnetion();
		String sql = "delete from public.turmas where tur_identificador=?";
		try{
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, IDtur);
			
			preparador.execute();
			preparador.close();
	
			out.println("Turma Deletada com Sucesso!");
		}catch(SQLException e){
			out.println("Erro ao Deletar Turma!" + e.getLocalizedMessage());
		}
	%>
</body>
</html>
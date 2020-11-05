<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.sql.*"
    import = "conexao.Conexao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Exclusão de Registro</title>
</head>
<body>
	<jsp:include page="cabecalhoProfessor.jsp"></jsp:include>
	<br>
	<h2>Operação Realizada com Sucesso!</h2>
	<br>
<%
	Integer IDprof = Integer.parseInt(request.getParameter("idprof"));
	Connection con = Conexao.getConnetion();
	String sql = "delete from public.professores where pro_identificador=?";
	try{
		PreparedStatement preparador = con.prepareStatement(sql);
		preparador.setInt(1, IDprof);
		
		preparador.execute();
		preparador.close();
	
		out.println("Professor Deletado com Sucesso!");
	}catch(SQLException e){
		out.println("Erro ao Deletar Professor!" + e.getLocalizedMessage());
	}
%>

</body>
</html>
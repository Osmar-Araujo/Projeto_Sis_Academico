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
<jsp:include page="cabecalhoCurso.jsp"></jsp:include>
<br>
<h2>Operação Realizada com Sucesso!</h2>
<br>
<%
	Integer IdCur = Integer.parseInt(request.getParameter("idcurso"));
	Connection con = Conexao.getConnetion();
	String sql = "delete from public.cursos where cur_identificador= ?";
	try{
		PreparedStatement preparador = con.prepareStatement(sql);
		preparador.setInt(1, IdCur);
		
		preparador.execute();
		preparador.close();
	
		out.println("Curso Deletado com Sucesso!");
	}catch(SQLException e){
		out.println("Erro ao Deletar curso!" + e.getLocalizedMessage());
	}
%>
</body>
</html>
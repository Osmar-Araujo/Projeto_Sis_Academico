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
<jsp:include page="cabecalhoDisciplina.jsp"></jsp:include>
<br>
<h2>Operação Realizada com Sucesso!</h2>
<br>
<%
	Integer IdDisc = Integer.parseInt(request.getParameter("iddisciplina"));
	Connection con = Conexao.getConnetion();
	String sql = "delete from public.disciplinas where dis_identificador= ?";
	try{
		PreparedStatement preparador = con.prepareStatement(sql);
		preparador.setInt(1, IdDisc);
		
		preparador.execute();
		preparador.close();
	
		out.println("Disciplina Deletada com Sucesso!");
	}catch(SQLException e){
		out.println("Erro ao Deletar disciplina!" + e.getLocalizedMessage());
	}
%>
</body>
</html>
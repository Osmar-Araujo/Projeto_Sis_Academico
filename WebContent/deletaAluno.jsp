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
<jsp:include page="cabecalhoALuno.jsp"></jsp:include>
<br>
<h2>Operação Realizada com sucesso!</h2>
	<%
	Integer idAluno = Integer.parseInt(request.getParameter("idaluno"));
	Connection con = Conexao.getConnetion();
	String sql = "delete from public.alunos where alu_identificador= ?";
	try {
		PreparedStatement preparador = con.prepareStatement(sql);
		preparador.setInt(1, idAluno);
		
		preparador.execute();
		preparador.close();
	
		out.println("Aluno Deletado com Sucesso!");
	} catch (SQLException e) {
		System.out.println("Erro ao apagar aluno - "+ e.getLocalizedMessage());
	}
	%>
</body>
</html>
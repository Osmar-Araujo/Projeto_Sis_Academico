<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "beans.Disciplina"
    import= "dao.disciplinaDao"
    import= "conexao.Conexao"
    import= "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alteração realizada com sucesso!</title>
<body>
<jsp:include page="cabecalhoDisciplina.jsp"></jsp:include>
<h2>Operação Realizada com Sucesso!</h2>
<br>
<%
	String disNome = request.getParameter("nomeDis");
	String dCargaH = request.getParameter("disCargah");
	String dEmenta = request.getParameter("ementa");
	Integer IDcur = Integer.parseInt(request.getParameter("idCurso"));
	Integer IDprof = Integer.parseInt(request.getParameter("idProf"));
	Integer discID = Integer.parseInt(request.getParameter("IDDisc"));

	Disciplina dis = new Disciplina();
	
	dis.setDis_nome(disNome);
	dis.setDis_carga_horaria(dCargaH);
	dis.setDis_ementa(dEmenta);
	dis.setDis_cur_identificador(IDcur);
	dis.setDis_pro_identificador(IDprof);
	dis.setDis_identificador(discID);
	
	disciplinaDao disDao = new disciplinaDao();
	disDao.alterarDisciplina(dis);
%>
<%= "Registro da Disciplina alterado."%>
</body>
</html>
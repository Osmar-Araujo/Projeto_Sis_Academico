<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Registro</title>
</head>
<body>
<jsp:include page="cabecalhoDisciplina.jsp"></jsp:include>
<br>
<br>
<form  action="alterarDisciplina.jsp" method="post">
  		<table> <tr>
      				<td align="left">ID da Disciplina: </td>
      				<td align="left"><input type="text" name="IDDisc" value="<%=request.getParameter("id_disc") %>" /></td>
    			</tr> 					
    			<tr>
      				<td align="left">Nome da Disciplina: </td>
      				<td align="left"><input type="text" name="nomeDis" value="<%=request.getParameter("dis_nome") %>" /></td>
    			</tr>
                <tr>
                    <td align="left">Carga horária:</td>
                    <td align="left"><input type="text" name="disCargah" value="<%=request.getParameter("dis_cargah") %>" /></td>
                </tr>
                <tr>
                    <td align="left">ID do curso:</td>
                    <td align="left"><input type="text" name="idCurso" value="<%=request.getParameter("id_curso") %>"/></td>
                </tr>
                <tr>
                    <td align="left">ID do professor:</td>
                    <td align="left"><input type="text" name="idProf" value="<%=request.getParameter("id_prof") %>" /></td>
                </tr>
                <tr>
                	<td align="left">Ementa:</td>
                </tr>
                <tr>
                    <td align="left"><textarea rows="20" cols="50" name="ementa"><%=request.getParameter("dis_ementa") %></textarea></td>
                </tr>
    			<tr>
      				<td align="left"><input type="submit"  value="SALVAR" /></td>
    			</tr>
  		</table>
	</form>
</body>
</html>
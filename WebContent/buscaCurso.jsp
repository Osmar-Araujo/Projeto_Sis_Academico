<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alterar Registro</title>
</head>
<body>
<jsp:include page="cabecalhoCurso.jsp"></jsp:include>
<br>
<br>
	<form  action="alterarCurso.jsp" method="post">
  		<table>
  				<tr>
  					<td align="left">ID do Curso: </td>
      				<td align="left"><input type="text" name="idcurso" value="<%=request.getParameter("id_curso") %>"/></td>
      			</tr>
    			<tr>
      				<td align="left">Nome do Curso: </td>
      				<td align="left"><input type="text" name="curnome" value="<%= request.getParameter("cur_nome") %>"/></td>
    			</tr>
                <tr>
                    <td align="left">Período do curso:</td>
                    <td align="left"><input type="text" name="curperiodo" value="<%= request.getParameter("cur_periodo") %>"/></td>
                </tr>
                <tr>
                    <td align="left">Descrição do curso:</td>
                </tr>
                <tr>
                    <td align="left"><textarea rows="20" cols="40" name="curdescricao"><%= request.getParameter("cur_desc") %></textarea></td>
                </tr>
    			<tr>
      				<td align="left"><input type="submit"  value="SALVAR" /></td>
    			</tr>
  		</table>
	</form>
</body>
</html>
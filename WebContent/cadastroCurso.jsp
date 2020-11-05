<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Cursos</title>
</head>
<body>
<jsp:include page="cabecalhoCurso.jsp"></jsp:include>
<br>
<h2>Cadastro de Cursos</h2>
	<form  action="SalvaCurso.jsp" method="post">
  		<table>  					
    			<tr>
      				<td align="left">Nome do Curso: </td>
      				<td align="left"><input type="text" name="cur_nome" /></td>
    			</tr>
                <tr>
                    <td align="left">Período do curso:</td>
                    <td align="left"><input type="text" name="cur_periodo" /></td>
                </tr>
                <tr>
                    <td align="left">Descrição do curso:</td>
                </tr>
                <tr>
                    <td align="left"><textarea rows="20" cols="40" name="curdescricao">Entre com a descrição do curso</textarea></td>
                </tr>
    			<tr>
      				<td align="left"><input type="submit"  value="CADASTRAR" /></td>
    			</tr>
  		</table>
	</form>
</body>
</html>
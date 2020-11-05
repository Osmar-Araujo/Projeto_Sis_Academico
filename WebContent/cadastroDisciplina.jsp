<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar Disciplina</title>
</head>
<body>
<jsp:include page="cabecalhoDisciplina.jsp"></jsp:include>
<br>
<br>
<form  action="SalvaDisciplina.jsp" method="post">
  		<table>  					
    			<tr>
      				<td align="left">Nome da Disciplina: </td>
      				<td align="left"><input type="text" name="disNome" /></td>
    			</tr>
                <tr>
                    <td align="left">Carga horária:</td>
                    <td align="left"><input type="text" name="disCargaH" /></td>
                </tr>
                <tr>
                    <td align="left">ID do curso:</td>
                    <td align="left"><input type="text" name="IDCurso" /></td>
                </tr>
                <tr>
                    <td align="left">ID do professor:</td>
                    <td align="left"><input type="text" name="IDProf" /></td>
                </tr>
                <tr>
                	<td align="left">Ementa:</td>
                </tr>
                <tr>
                    <td align="left"><textarea rows="20" cols="50" name="disEmenta">Ementa da Disciplina</textarea></td>
                </tr>
    			<tr>
      				<td align="left"><input type="submit"  value="CADASTRAR" /></td>
    			</tr>
  		</table>
	</form>
</body>
</html>
package teste;
import java.sql.SQLException;
import conexao.Conexao;

public class testConexao {
	public static void main(String[] args) throws SQLException {
		Conexao.getConnetion();
	}
}

package conexao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {
public static Connection getConnetion(){
		
		Connection con = null;
		try {
			try {
				Class.forName("org.postgresql.Driver");
				con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/Exemplo", "postgres", "mar1212");
			} catch (ClassNotFoundException e) {
				System.out.println("Erro de Driver!" + e.getMessage());}
		} catch (SQLException e) {
			System.out.println("Erro na conexão!" + e.getMessage());
		}return con;

	}
}

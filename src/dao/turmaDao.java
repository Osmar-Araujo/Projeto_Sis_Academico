package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Turma;
import conexao.Conexao;

public class turmaDao {
Connection con = Conexao.getConnetion();
	
	public void cadastrarTurma(Turma turma) {
		String sql = "insert into public.turmas (tur_descricao, tur_cur_identificador) values (?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, turma.getTur_descricao());
			preparador.setInt(2, turma.getTur_cur_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Turma Cadastrada com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao cadastrar turma - "+ e.getLocalizedMessage());
		}
		
	}
	
	public void alterarTurma(Turma turma) {
		String sql = "update public.turmas set tur_descricao=?, tur_cur_identificador=? WHERE tur_identificador=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, turma.getTur_descricao());
			preparador.setInt(2, turma.getTur_cur_identificador());
			preparador.setInt(3, turma.getTur_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Turma Alterada com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao alterar turma - "+ e.getLocalizedMessage());
		}
		
	}
	
	public void deletarTurma(Turma turma) {
		String sql = "delete from public.turmas where tur_identificador=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, turma.getTur_identificador());
			
			preparador.execute();
			preparador.close();
		
			System.out.println("Turma Deletada com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao deletar turma - "+ e.getLocalizedMessage());
		}
	}
	
	public List<Turma> buscarTodasTurmas (Turma turma){
		List<Turma> lista = new ArrayList<Turma>();
		String sql = "select * from public.turmas order by tur_identificador";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				Turma tur = new Turma();
				tur.setTur_identificador(resultados.getInt("tur_identificador"));
				tur.setTur_descricao(resultados.getString("tur_descricao"));
				tur.setTur_cur_identificador(resultados.getInt("tur_cur_identificador"));
				
				lista.add(tur);
			}
		} catch (SQLException e) {
			System.out.println("Erro ao listar turma - " + e.getLocalizedMessage());
		}return lista;
	}
}

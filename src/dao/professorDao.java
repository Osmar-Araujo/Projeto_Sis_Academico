package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Professor;
import conexao.Conexao;

public class professorDao {
Connection con = Conexao.getConnetion();
	
	public void cadastroProfessor(Professor professor) {
		String sql = "insert into public.professores (pro_nome, pro_titulacao) values (?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, professor.getPro_nome());
			preparador.setString(2, professor.getPro_titulacao());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Professor Cadastrado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao cadastrar professor - "+ e.getLocalizedMessage());
		}
	}
	
	public void alterarProfessor(Professor professor) {
		String sql = "update public.professores set pro_nome=?, pro_titulacao=? WHERE pro_identificador = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, professor.getPro_nome());
			preparador.setString(2, professor.getPro_titulacao());
			preparador.setInt(3, professor.getPro_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Professor Alterado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao alterar professor - "+ e.getLocalizedMessage());
		}
	}
	
	public void deletarProfessor(Professor professor) {
		String sql = "delete from public.professores where pro_identificador=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1,professor.getPro_identificador());
			
			preparador.execute();
			preparador.close();
		
			System.out.println("Professor Deletado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao apagar professor - "+ e.getLocalizedMessage());
		}
	}
	
	public List<Professor> buscarTodosProfessores(Professor professor){
		String sql = "select * from public.professores order by pro_nome";
		List<Professor> lista = new ArrayList<Professor>();
		
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				Professor prof = new Professor();
				prof.setPro_identificador(resultados.getInt("pro_identificador"));
				prof.setPro_nome(resultados.getString("pro_nome"));
				prof.setPro_titulacao(resultados.getString("pro_titulacao"));
				
				
				lista.add(prof);
			}
		} catch (SQLException e) {
			System.out.println("Erro ao listar professores - " + e.getLocalizedMessage());
		}return lista;
	}
}

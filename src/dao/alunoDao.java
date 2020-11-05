package dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Aluno;
import conexao.Conexao;

public class alunoDao {
Connection con = Conexao.getConnetion();
	
	public void cadastroAluno(Aluno aluno) {
		String sql = "insert into public.alunos (alu_nome,alu_tur_identificador) values (?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, aluno.getAlu_nome());
			preparador.setInt(2, aluno.getAlu_tur_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println(" Aluno Cadastrado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao cadastrar aluno - "+ e.getLocalizedMessage());
		}
	}
	public void alterarAluno(Aluno aluno) {
		String sql = "update public.alunos set alu_nome=?, alu_tur_identificador=? WHERE alu_identificador = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, aluno.getAlu_nome());
			preparador.setInt(2, aluno.getAlu_tur_identificador());
			preparador.setInt(3, aluno.getAlu_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Aluno Alterado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao editar aluno - "+ e.getLocalizedMessage());
		}
	}
	
	public void deletarAluno(Aluno aluno) {
		String sql = "delete from public.alunos where alu_identificador= ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, aluno.getAlu_identificador());
			
			preparador.execute();
			preparador.close();
		
			System.out.println("Aluno Deletado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao apagar aluno - "+ e.getLocalizedMessage());
		}
	}
	
	public List<Aluno> buscarTodosAlunos(Aluno aluno){
		String sql = "select * from public.alunos order by alu_nome";
		List<Aluno> lista = new ArrayList<Aluno>();
		
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				Aluno alu = new Aluno();
				alu.setAlu_identificador(resultados.getInt("alu_identificador"));
				alu.setAlu_nome(resultados.getString("alu_nome"));
				alu.setAlu_tur_identificador(resultados.getInt("alu_tur_identificador"));
				lista.add(alu);
			}
		} catch (SQLException e) {
			System.out.println("Erro ao listar alunos - " + e.getLocalizedMessage());
		}return lista;
	}
	
}

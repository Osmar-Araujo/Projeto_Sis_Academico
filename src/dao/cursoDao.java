package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Curso;
import conexao.Conexao;

public class cursoDao {
Connection con = Conexao.getConnetion();
	
	public void cadastroCurso(Curso curso) {
		String sql = "insert into public.cursos (cur_nome, cur_periodo, cur_descricao) values (?,?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, curso.getCur_nome());
			preparador.setString(2,curso.getCur_periodo());
			preparador.setString(3, curso.getCur_descricao());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Curso Cadastrado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao cadastrar curso - "+ e.getLocalizedMessage());
		}
	}
	
	public void alterarCurso(Curso curso) {
		String sql = "update public.cursos set cur_nome=?, cur_periodo=?, cur_descricao=? WHERE cur_identificador = ?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1, curso.getCur_nome());
			preparador.setString(2, curso.getCur_periodo());
			preparador.setString(3, curso.getCur_descricao());
			preparador.setInt(4, curso.getCur_identificador());
			
			preparador.execute();
			preparador.close();
		
			System.out.println("Curso Alterado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao editar curso - "+ e.getLocalizedMessage());
		}
	}
	
	public void deletarCurso(Curso curso) {
		String sql = "delete from public.cursos where cur_identificador=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, curso.getCur_identificador());
			
			preparador.execute();
			preparador.close();
		
			System.out.println("Curso Deletado com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao apagar curso - "+ e.getLocalizedMessage());
		}
	}
	
	public List<Curso> buscarTodosCursos(Curso curso){
		String sql = "select * from public.cursos order by cur_identificador";
		List<Curso> lista = new ArrayList<Curso>();
		
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				Curso cur = new Curso();
				cur.setCur_identificador(resultados.getInt("cur_identificador"));
				cur.setCur_nome(resultados.getString("cur_nome"));
				cur.setCur_periodo(resultados.getString("cur_periodo"));
				cur.setCur_descricao(resultados.getString("cur_descricao"));
				lista.add(cur);
			}
		} catch (SQLException e) {
			System.out.println("Erro ao listar curso - " + e.getLocalizedMessage());
		}return lista;
	}
}

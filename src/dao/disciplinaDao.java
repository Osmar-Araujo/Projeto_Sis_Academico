package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import beans.Disciplina;
import conexao.Conexao;

public class disciplinaDao {
Connection con = Conexao.getConnetion();
	
	public void cadastroDisciplina(Disciplina disciplina) {
		String sql = "insert into public.disciplinas (dis_nome, dis_carga_horaria, dis_ementa, dis_cur_identificador, dis_pro_identificador) values (?,?,?,?,?)";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1,disciplina.getDis_nome() );
			preparador.setString(2,disciplina.getDis_carga_horaria());
			preparador.setString(3,disciplina.getDis_ementa());
			preparador.setInt(4, disciplina.getDis_cur_identificador());
			preparador.setInt(5, disciplina.getDis_pro_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Disciplina Cadastrada com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro - "+ e.getLocalizedMessage());
		}
	}
	
	public void alterarDisciplina(Disciplina disciplina) {
		String sql = "update public.disciplinas set dis_nome=?, dis_carga_horaria=?, dis_ementa=?, dis_cur_identificador=?, dis_pro_identificador=? where dis_identificador=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setString(1,disciplina.getDis_nome() );
			preparador.setString(2,disciplina.getDis_carga_horaria());
			preparador.setString(3,disciplina.getDis_ementa());
			preparador.setInt(4, disciplina.getDis_cur_identificador());
			preparador.setInt(5, disciplina.getDis_pro_identificador());
			preparador.setInt(6, disciplina.getDis_identificador());
			
			preparador.execute();
			preparador.close();
			
			System.out.println("Disciplina Alterada com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao alterar disciplina - "+ e.getLocalizedMessage());
		}
	}
	
	public void deletarDisciplina(Disciplina disciplina) {
		String sql = "delete from public.disciplinas where dis_identificador=?";
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			preparador.setInt(1, disciplina.getDis_identificador());
			
			preparador.execute();
			preparador.close();
		
			System.out.println("Disciplina Deletada com Sucesso!");
		} catch (SQLException e) {
			System.out.println("Erro ao apagar disciplina - "+ e.getLocalizedMessage());
		}
	}
	
	public List<Disciplina> buscarTodasDisciplinas(Disciplina disciplina){
		String sql = "select * from public.disciplinas order by dis_identificador";
		List<Disciplina> lista = new ArrayList<Disciplina>();
		
		try {
			PreparedStatement preparador = con.prepareStatement(sql);
			ResultSet resultados = preparador.executeQuery();
			while(resultados.next()) {
				Disciplina disc = new Disciplina();
				disc.setDis_identificador(resultados.getInt("dis_identificador"));
				disc.setDis_nome(resultados.getString("dis_nome"));
				disc.setDis_carga_horaria(resultados.getString("dis_carga_horaria"));
				disc.setDis_ementa(resultados.getString("dis_ementa"));
				disc.setDis_cur_identificador(resultados.getInt("dis_cur_identificador"));
				disc.setDis_pro_identificador(resultados.getInt("dis_pro_identificador"));
				
				lista.add(disc);
			}
		} catch (SQLException e) {
			System.out.println("Erro ao listar disciplinas - " + e.getLocalizedMessage());
		}return lista;
	}
}

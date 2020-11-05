package teste;

import java.util.List;

import beans.Disciplina;
import dao.disciplinaDao;

public class testDisciplinaDao {

	public static void main(String[] args) {
		//testCadastroDisciplinas();
		//testAlterarDisciplinas();
		//testDeletarDisciplinas();
		testSelecionarDisciplinas();
	}
	
	public static void testCadastroDisciplinas() {
		Disciplina disciplina = new Disciplina();
		disciplina.setDis_nome("Arquitetura de Computadores");
		disciplina.setDis_carga_horaria("100 horas");
		disciplina.setDis_ementa("Introdu��o � organiza��o e arquitetura de computadores. Linguagem de montagem e de m�quina. Unidade\r\n" + 
				"central de processamento. Sistemas de mem�ria e entrada e sa�da. Evolu��o dos computadores. ");
		disciplina.setDis_cur_identificador(2);
		disciplina.setDis_pro_identificador(1);
		
		disciplinaDao disDao = new disciplinaDao();
		disDao.cadastroDisciplina(disciplina);
	}
	
	public static void testAlterarDisciplinas() {
		Disciplina disciplina = new Disciplina();
		disciplina.setDis_nome("Engenharia de software");
		disciplina.setDis_carga_horaria("80 horas");
		disciplina.setDis_ementa("Vis�o geral sobre a Engenharia de Software; Processos de desenvolvimento de software; Pr�ticas de\r\n" + 
				"desenvolvimento de software; Modelos de processo; Engenharia de requisitos; Planejamento e\r\n" + 
				"gerenciamento de projetos; Especifica��o de software; Projeto de software; Metodologias de\r\n" + 
				"desenvolvimento de software; Verifica��o, Valida��o e Teste de Software; Evolu��o de software;\r\n" + 
				"Gerenciamento de configura��o de software; Ferramentas CASE.\r\n" + 
				"");
		disciplina.setDis_cur_identificador(2);
		disciplina.setDis_pro_identificador(1);
		disciplina.setDis_identificador(1);
		
		disciplinaDao disDao = new disciplinaDao();
		disDao.alterarDisciplina(disciplina);
	}
	
	public static void testDeletarDisciplinas() {	
		Disciplina disciplina = new Disciplina();
		disciplina.setDis_identificador(2);
		
		disciplinaDao disDao = new disciplinaDao();
		disDao.deletarDisciplina(disciplina);
	}
	
	public static void testSelecionarDisciplinas(){
		Disciplina disciplina = new Disciplina();
		disciplinaDao disDao = new disciplinaDao();
		List<Disciplina> listaResultados = disDao.buscarTodasDisciplinas(disciplina);
		for(Disciplina d:listaResultados) {
			System.out.println("ID: " + d.getDis_identificador() + " Nome da disciplina: " + d.getDis_nome() + 
					" Carga hor�ria: " + d.getDis_carga_horaria() + " Ementa: "+ d.getDis_ementa() + " Id do curso vinculado: " + 
					d.getDis_cur_identificador() + " Id do professor que ministra: " + d.getDis_pro_identificador());
		}
	}
	
	
}

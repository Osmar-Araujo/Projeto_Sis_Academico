package teste;

import java.util.List;
import beans.Turma;
import dao.turmaDao;

public class testTurmaDao {

	public static void main(String[] args) {
		//testCadastroTurma();
		//testAlterarTurma();
		//testDeletarTurma();
		testSelecionarTurmas();
	}
	
	public static void testCadastroTurma() {
		Turma turma = new Turma();
		turma.setTur_descricao("Turma noturna de Análise de Sistemas");
		turma.setTur_cur_identificador(3);
		
		turmaDao turDao = new turmaDao();
		turDao.cadastrarTurma(turma);
	}
	
	public static void testAlterarTurma() {
		Turma turma = new Turma();
		turma.setTur_descricao("Turma noturna de Análise de Sistemas");
		turma.setTur_cur_identificador(3);
		turma.setTur_identificador(3);
		
		turmaDao turDao = new turmaDao();
		turDao.alterarTurma(turma);
	}
	
	public static  void testDeletarTurma() {
		Turma turma = new Turma();
		turma.setTur_identificador(2);
		
		turmaDao turDao = new turmaDao();
		turDao.deletarTurma(turma);
	}
	
	public static void testSelecionarTurmas() {
		Turma turma = new Turma();
		turmaDao turDao = new turmaDao();
		List<Turma> listaResultados = turDao.buscarTodasTurmas(turma);
		
		for (Turma t:listaResultados) {
			System.out.println("ID da turma: " + t.getTur_identificador() + " Descrição da Turma: " + 
		    t.getTur_descricao() + " ID do curso de referência: " + t.getTur_cur_identificador());
		}
	} 
	
}

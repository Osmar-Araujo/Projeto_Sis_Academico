package teste;

import java.util.List;

import beans.Curso;
import dao.cursoDao;

public class testCursoDao {
	public static void main(String[] args) {
		//testCadastroCurso();
		//testAlterarCurso();
		//testDeletarCurso();
		testSelecionarCurso();
		
	}
	
	public static void testCadastroCurso() {
		Curso curso = new Curso();
		curso.setCur_nome("Análise de Sistemas");
		curso.setCur_periodo("Manhã");
		curso.setCur_descricao("Curso para a formação de tecnólogos em Análise de Sistemas com duração de 3 anos");
		
		cursoDao curDao = new cursoDao();
		curDao.cadastroCurso(curso);
	}

	public static void testAlterarCurso() {
	Curso curso = new Curso();
		curso.setCur_nome("Análise de Sistemas ");
		curso.setCur_periodo("Noite");
		curso.setCur_descricao("Curso para a formação de tecnólogos em Análise de Sistemas com duração de 3 anos");
		curso.setCur_identificador(3);
		
		cursoDao curDao = new cursoDao();
		curDao.alterarCurso(curso);
	}
	
	public static void testDeletarCurso() {
		Curso cursos = new Curso();
		cursos.setCur_identificador(4);
		
		cursoDao curDao = new cursoDao();
		curDao.deletarCurso(cursos);
	}
	
	public static void testSelecionarCurso() {
		Curso curso = new Curso();
		cursoDao curDao = new cursoDao();
		List<Curso> listaResultado = curDao.buscarTodosCursos(curso);
		
		for(Curso c:listaResultado) {
			System.out.println("Id: " + c.getCur_identificador() + " Nome do curso: " + c.getCur_nome() + " Período: " + c.getCur_periodo() + " Descrição "+ c.getCur_descricao());
		}
	}
}

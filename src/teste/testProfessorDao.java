package teste;

import java.util.List;

import beans.Professor;
import dao.professorDao;

public class testProfessorDao {

	public static void main(String[] args) {
		//testCadastroProfessor();
		//testAlterarProfessor();
		//testDeletarProfessor();
		  testSelecionarProfessores();

	}

	public static void testCadastroProfessor() {
		Professor professor = new Professor();
		
		professor.setPro_nome("João Bobão");
		professor.setPro_titulacao("Doutor em palhaçada pelo Cirque de Soleil");
		
		professorDao profDao = new professorDao();
		profDao.cadastroProfessor(professor);
	}
	
	public static void testAlterarProfessor(){
        Professor professor = new Professor();
		
		professor.setPro_nome("João Dor Flex");
		professor.setPro_titulacao("Doutor em Física Quântica pela USP");
		professor.setPro_identificador(2);
		
		professorDao profDao = new professorDao();
		profDao.alterarProfessor(professor);
	}
	
	public static void testDeletarProfessor() {
		Professor professor = new Professor();
		
		professor.setPro_identificador(5);
		
		professorDao profDao = new professorDao();
		profDao.deletarProfessor(professor);
	}
	
	public static void testSelecionarProfessores(){
		Professor professor = new Professor();
		professorDao profDao = new professorDao();
		List<Professor> listaResultados = profDao.buscarTodosProfessores(professor);
		for(Professor p:listaResultados) {
			System.out.println("ID Professor: "+ p.getPro_identificador() + " Nome do Profº: " + p.getPro_nome() + " Titulação: " + p.getPro_titulacao());
		}
		
	}
	
}

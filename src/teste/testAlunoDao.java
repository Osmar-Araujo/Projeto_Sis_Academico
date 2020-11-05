package teste;

import java.util.List;

import beans.Aluno;
import dao.alunoDao;

public class testAlunoDao {

	public static void main(String[] args) {
		//testCadastroAluno();
		//testAlterarAluno();
		//testDeletarAluno();
		testSelecionarAluno();
	}
	public static void testCadastroAluno() {
		Aluno aluno = new Aluno();
		aluno.setAlu_nome("Marcos Pontes");
		aluno.setAlu_tur_identificador(1);
		
		alunoDao aluDao = new alunoDao();
		aluDao.cadastroAluno(aluno);
	}

	public static void testAlterarAluno() {
		Aluno alunos = new Aluno();
		alunos.setAlu_identificador(3);
		alunos.setAlu_nome("Osmar Prado");
		alunos.setAlu_tur_identificador(1);
		
		alunoDao aluDao = new alunoDao();
		aluDao.alterarAluno(alunos);
	}
	
	public static void testDeletarAluno() {
		Aluno aluno = new Aluno();
		aluno.setAlu_identificador(9);
		
		alunoDao aluDao = new alunoDao();
		aluDao.deletarAluno(aluno);
	}
	
	public static void testSelecionarAluno() {
		Aluno aluno = new Aluno();
		alunoDao aluDao = new alunoDao();
		List<Aluno> listaResultado = aluDao.buscarTodosAlunos(aluno);
		
		for(Aluno a:listaResultado) {
			System.out.println("Id: " + a.getAlu_identificador() + " Nome: " + a.getAlu_nome() + " Turma: " + a.getAlu_tur_identificador());
		}
	}
	
	
}

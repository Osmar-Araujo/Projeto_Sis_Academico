package beans;

public class RelTurCur {
	private Integer cur_identificador;
	private String cur_nome;
	private Integer tur_identificador;
	private String tur_descricao;
	
	public Integer getCur_identificador() {
		return cur_identificador;
	}
	public void setCur_identificador(Integer cur_identificador) {
		this.cur_identificador = cur_identificador;
	}
	public String getCur_nome() {
		return cur_nome;
	}
	public void setCur_nome(String cur_nome) {
		this.cur_nome = cur_nome;
	}
	public Integer getTur_identificador() {
		return tur_identificador;
	}
	public void setTur_identificador(Integer tur_identificador) {
		this.tur_identificador = tur_identificador;
	}
	public String getTur_descricao() {
		return tur_descricao;
	}
	public void setTur_descricao(String tur_descricao) {
		this.tur_descricao = tur_descricao;
	}	
}

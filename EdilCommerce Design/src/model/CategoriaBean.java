package model;

import java.sql.Blob;

public class CategoriaBean {
	Blob immagine;
	String nome;
	String descrizione;


	public CategoriaBean() {
		immagine = null;
		nome = "";
		descrizione ="";
	}


	public Blob getImmagine() {
		return immagine;
	}


	public void setImmagine(Blob immagine) {
		this.immagine = immagine;
	}


	public String getNome() {
		return nome;
	}


	public void setNome(String nome) {
		this.nome = nome;
	}


	public String getDescrizione() {
		return descrizione;
	}


	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}
	
	
	@Override
	public boolean equals(Object obj) {
		return this.getNome() == ((CategoriaBean) obj).getNome();
	}
	
	public boolean isEmpty(Object obj) {
		return this.getNome() == "";
	}
	
	public String toString(Object obj) {
		return nome + " (" + descrizione + ") " + immagine;
	}
	
}	





package model;

public class UserBean {
	String username;
	String nome;
	String cognome;
	String email;
	String telefono;
	String indirizzo;
	String userPassword;
	
	public UserBean() {
		username = "";
		nome = "";
		cognome = "";
		email = "";
		telefono = "";
		indirizzo = "";
		userPassword = "";
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getCognome() {
		return cognome;
	}
	public void setCognome(String cognome) {
		this.cognome = cognome;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	
	public String getIndirizzo() {
		return indirizzo;
	}
	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}
	
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	
	@Override
	public boolean equals(Object obj) {
		return this.getUsername() == ((UserBean) obj).getUsername();
	}
}

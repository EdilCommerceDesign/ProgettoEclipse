package model;

import java.sql.Date;

public class PagamentoBean {
	int numeroPagamento;
	int numeroOrdine;
	Date data;
	double importo;
	
	public PagamentoBean() {
		numeroPagamento = 0;
		numeroOrdine = 0;
		data = null;
		importo = 0;
	   
	}
	
	public int getNumeroPagamento() {
		return numeroPagamento;
	}
	public void setNumeroPagamento(int numeroPagamento) {
		this.numeroPagamento = numeroPagamento;
	}
	public int getNumeroOrdine() {
		return numeroOrdine;
	}
	public void setNumeroOrdine(int numeroOrdine) {
		this.numeroOrdine = numeroOrdine;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public double getImporto() {
		return importo;
	}
	public void setImporto(double importo) {
		this.importo = importo;
	}
	public boolean isEmpty() {
		return numeroPagamento == 0;
	}
	@Override
	public boolean equals(Object obj) {
		return this.getNumeroPagamento()==((PagamentoBean) obj).getNumeroPagamento();
	}
	@Override
	public String toString() {
		return numeroPagamento + ", " + numeroOrdine + ", " + data + ", " +  importo ;

	}
}

package it.unisa;

import java.io.Serializable;

public class ProductBean implements Serializable {

	private static final long serialVersionUID = 1L;

	int id;
	String nome;
	String descrizione;
	String tipo;
	String data;
	String regione;
	int prezzo;
	int quantity;

	public ProductBean() {
		id = -1;
		nome = "";
		descrizione = "";
		regione="";
		tipo= "";
		data= "";
		prezzo=0;
		quantity = 0;
	}

	public int getId() {
		return id;
	}

	public void setId(int code) {
		this.id = code;
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

	public int getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(int prezzo) {
		this.prezzo = prezzo;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getTipo() {
		return tipo;
	}
	
	public void setTipo(String tipo) {
		this.tipo= tipo;
	}
	
	public String getData() {
		return data;
	}
	
	public void setData(String data) {
		this.data= data;
	}
	
	public String getRegione() {
		return regione;
	}
	public void setRegione(String regione) {
		this.regione=regione;
	}

	@Override
	public String toString() {
		return nome + " (" + id + "), " + prezzo + " " + quantity + ". " + descrizione + " " + regione + " " + tipo + " " + data ;
	}

}

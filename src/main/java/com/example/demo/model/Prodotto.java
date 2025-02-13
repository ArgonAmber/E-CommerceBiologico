package com.example.demo.model;

import java.util.Objects;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table("prodotto")
public class Prodotto {
	
	@Id // annotazione spring che collega l'attributo id della classe all'id della tabella su MySQL
	private int id;
	
	@Column("codArt") // annotazione spring che collega codArt della tabella al codArt attributo
	private String codArt;
	
	private String nomeProdotto;
	private String categoria;
	private String descrizione;
	private String provenienza;
	private double prezzo;
	
	public Prodotto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Prodotto(String codArt, String nomeProdotto, String categoria, String descrizione,
			String provenienza, double prezzo) {
		super();
		this.codArt = codArt;
		this.nomeProdotto = nomeProdotto;
		this.categoria = categoria;
		this.descrizione = descrizione;
		this.provenienza = provenienza;
		this.prezzo = prezzo;
	}

	public Prodotto(int id, String codArt, String nomeProdotto, String categoria, String descrizione,
			String provenienza, double prezzo) {
		super();
		this.id = id;
		this.codArt = codArt;
		this.nomeProdotto = nomeProdotto;
		this.categoria = categoria;
		this.descrizione = descrizione;
		this.provenienza = provenienza;
		this.prezzo = prezzo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodArt() {
		return codArt;
	}

	public void setCodArt(String codArt) {
		this.codArt = codArt;
	}

	public String getNomeProdotto() {
		return nomeProdotto;
	}

	public void setNomeProdotto(String nomeProdotto) {
		this.nomeProdotto = nomeProdotto;
	}

	public String getCategoria() {
		return categoria;
	}

	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public String getProvenienza() {
		return provenienza;
	}

	public void setProvenienza(String provenienza) {
		this.provenienza = provenienza;
	}

	public double getPrezzo() {
		return prezzo;
	}

	public void setPrezzo(double prezzo) {
		this.prezzo = prezzo;
	}

	@Override
	public int hashCode() {
		return Objects.hash(categoria, codArt, descrizione, id, nomeProdotto, prezzo, provenienza);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Prodotto other = (Prodotto) obj;
		return Objects.equals(categoria, other.categoria) && Objects.equals(codArt, other.codArt)
				&& Objects.equals(descrizione, other.descrizione) && id == other.id
				&& Objects.equals(nomeProdotto, other.nomeProdotto)
				&& Double.doubleToLongBits(prezzo) == Double.doubleToLongBits(other.prezzo)
				&& Objects.equals(provenienza, other.provenienza);
	}

	@Override
	public String toString() {
		return "ID: " + id + "\n Codice articolo: " + codArt + "\nNome prodotto: " + nomeProdotto + "\nCategoria: "
				+ categoria + "\nDescrizione: " + descrizione + "\nProvenienza: " + provenienza + "\nPrezzo: " + prezzo;
	}

}

package com.example.demo.model;

import java.util.Objects;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table("prodotto")
public class Prodotto {

	@Id // annotazione spring che collega l'attributo id della classe all'id della
		// tabella su MySQL
	private int id;

    @Column("codProd") 
    private String codProd;

    @Column("nomeProdotto")  // Aggiunto mapping esplicito delle colonne
    private String nomeProdotto;

    @Column("categoria")
    private String categoria;

    @Column("descrizione")
    private String descrizione;

    @Column("provenienza")
    private String provenienza;

    @Column("prezzo")
    private double prezzo;

    @Column("immagine")
    private String immagine;

	public Prodotto(int id, String codProd, String nomeProdotto, String categoria, String descrizione,
			String provenienza, double prezzo, String immagine) {
		super();
		this.id = id;
		this.codProd = codProd;
		this.nomeProdotto = nomeProdotto;
		this.categoria = categoria;
		this.descrizione = descrizione;
		this.provenienza = provenienza;
		this.prezzo = prezzo;
		this.immagine = immagine;
	}

	public Prodotto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodProd() {
		return codProd;
	}

	public void setCodProd(String codProd) {
		this.codProd = codProd;
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

	public String getImmagine() {
		return immagine;
	}

	public void setImmagine(String immagine) {
		this.immagine = immagine;
	}

	@Override
	public int hashCode() {
		return Objects.hash(categoria, codProd, descrizione, id, immagine, nomeProdotto, prezzo, provenienza);
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
		return Objects.equals(categoria, other.categoria) && Objects.equals(codProd, other.codProd)
				&& Objects.equals(descrizione, other.descrizione) && id == other.id
				&& Objects.equals(immagine, other.immagine) && Objects.equals(nomeProdotto, other.nomeProdotto)
				&& Double.doubleToLongBits(prezzo) == Double.doubleToLongBits(other.prezzo)
				&& Objects.equals(provenienza, other.provenienza);
	}

	@Override
	public String toString() {
		return "Prodotto [id=" + id + ", codProd=" + codProd + ", nomeProdotto=" + nomeProdotto + ", categoria="
				+ categoria + ", descrizione=" + descrizione + ", provenienza=" + provenienza + ", prezzo=" + prezzo
				+ ", immagine=" + immagine + "]";
	}

}

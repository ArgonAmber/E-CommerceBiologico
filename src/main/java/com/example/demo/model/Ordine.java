package com.example.demo.model;

import java.util.Objects;

import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;

public class Ordine {
	
	@Id
	private int id;
	
	@Column("codOrdine")
	private String codOrdine;
	
	@Column("username")
	private String username;
	
	@Column("email")
	private String email;

	public Ordine() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Ordine(int id, String codOrdine, String username, String email) {
		super();
		this.id = id;
		this.codOrdine = codOrdine;
		this.username = username;
		this.email = email;
	}

	public Ordine(String codOrdine, String username, String email) {
		super();
		this.codOrdine = codOrdine;
		this.username = username;
		this.email = email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCodOrdine() {
		return codOrdine;
	}

	public void setCodOrdine(String codOrdine) {
		this.codOrdine = codOrdine;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public int hashCode() {
		return Objects.hash(codOrdine, email, id, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ordine other = (Ordine) obj;
		return Objects.equals(codOrdine, other.codOrdine) && Objects.equals(email, other.email) && id == other.id
				&& Objects.equals(username, other.username);
	}

	@Override
	public String toString() {
		return "Ordine [id=" + id + ", codOrdine=" + codOrdine + ", username=" + username + ", email=" + email + "]";
	}
	
}

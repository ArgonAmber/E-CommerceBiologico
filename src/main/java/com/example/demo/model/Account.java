package com.example.demo.model;

import java.util.Objects;

import org.springframework.data.annotation.Id;

public class Account {
	
	@Id
	private int id;
	
	private String username;
	private String password;
	
	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Account(int id, String username, String password) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
	}
	
	public Account(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id, password, username);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Account other = (Account) obj;
		return id == other.id && Objects.equals(password, other.password) && Objects.equals(username, other.username);
	}

	@Override
	public String toString() {
		return "ID: " + id + "\nUsername: " + username + "\nPassword: " + password;
	}

}

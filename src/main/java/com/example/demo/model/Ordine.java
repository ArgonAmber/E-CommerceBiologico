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

    // NUOVI CAMPI per gestire il metodo di pagamento
    @Column("metodoPagamento")
    private String metodoPagamento; 

    @Column("numeroCarta")
    private String numeroCarta; 

    @Column("scadenza")
    private String scadenza;

    @Column("cvv")
    private String cvv;

    @Column("paypalEmail")
    private String paypalEmail; 

    // Costruttore vuoto
    public Ordine() {
    }

    // Costruttore con parametri base
    public Ordine(String codOrdine, String username, String email, String metodoPagamento) {
        this.codOrdine = codOrdine;
        this.username = username;
        this.email = email;
        this.metodoPagamento = metodoPagamento;
    }

    // Getter e Setter
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCodOrdine() { return codOrdine; }
    public void setCodOrdine(String codOrdine) { this.codOrdine = codOrdine; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getMetodoPagamento() { return metodoPagamento; }
    public void setMetodoPagamento(String metodoPagamento) { this.metodoPagamento = metodoPagamento; }

    public String getNumeroCarta() { return numeroCarta; }
    public void setNumeroCarta(String numeroCarta) { this.numeroCarta = numeroCarta; }

    public String getScadenza() { return scadenza; }
    public void setScadenza(String scadenza) { this.scadenza = scadenza; }

    public String getCvv() { return cvv; }
    public void setCvv(String cvv) { this.cvv = cvv; }

    public String getPaypalEmail() { return paypalEmail; }
    public void setPaypalEmail(String paypalEmail) { this.paypalEmail = paypalEmail; }

    @Override
    public int hashCode() {
        return Objects.hash(codOrdine, email, id, username, metodoPagamento, numeroCarta, scadenza, cvv, paypalEmail);
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        Ordine other = (Ordine) obj;
        return id == other.id &&
                Objects.equals(codOrdine, other.codOrdine) &&
                Objects.equals(email, other.email) &&
                Objects.equals(username, other.username) &&
                Objects.equals(metodoPagamento, other.metodoPagamento) &&
                Objects.equals(numeroCarta, other.numeroCarta) &&
                Objects.equals(scadenza, other.scadenza) &&
                Objects.equals(cvv, other.cvv) &&
                Objects.equals(paypalEmail, other.paypalEmail);
    }

    @Override
    public String toString() {
        return "Ordine [id=" + id + ", codOrdine=" + codOrdine + ", username=" + username + ", email=" + email
                + ", metodoPagamento=" + metodoPagamento + ", numeroCarta=" + numeroCarta + ", scadenza=" + scadenza
                + ", cvv=" + cvv + ", paypalEmail=" + paypalEmail + "]";
    }

}

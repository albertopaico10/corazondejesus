package com.project.george.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;


/**
 * The persistent class for the tb_kardex database table.
 * 
 */
@Entity
@Table(name="tb_kardex")
public class TbKardex implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int id;

	private int countProduct;

	@Column(name="date_created")
	private Timestamp dateCreated;

	private String description;
	
	private BigDecimal priceKardex;
	
	private BigDecimal priceTotalProduct;
	
	private BigDecimal priceTotalSale;

	private int status;
	
	private int idProduct;

	@Column(name="total_egress")
	private int totalEgress;

	@Column(name="total_entry")
	private int totalEntry;

	public TbKardex() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCountProduct() {
		return this.countProduct;
	}

	public void setCountProduct(int countProduct) {
		this.countProduct = countProduct;
	}

	public Timestamp getDateCreated() {
		return this.dateCreated;
	}

	public void setDateCreated(Timestamp dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getPriceKardex() {
		return this.priceKardex;
	}

	public void setPriceKardex(BigDecimal priceKardex) {
		this.priceKardex = priceKardex;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getTotalEgress() {
		return this.totalEgress;
	}

	public void setTotalEgress(int totalEgress) {
		this.totalEgress = totalEgress;
	}

	public int getTotalEntry() {
		return this.totalEntry;
	}

	public void setTotalEntry(int totalEntry) {
		this.totalEntry = totalEntry;
	}

	public BigDecimal getPriceTotalProduct() {
		return priceTotalProduct;
	}

	public void setPriceTotalProduct(BigDecimal priceTotalProduct) {
		this.priceTotalProduct = priceTotalProduct;
	}

	public BigDecimal getPriceTotalSale() {
		return priceTotalSale;
	}

	public void setPriceTotalSale(BigDecimal priceTotalSale) {
		this.priceTotalSale = priceTotalSale;
	}

	public int getIdProduct() {
		return idProduct;
	}

	public void setIdProduct(int idProduct) {
		this.idProduct = idProduct;
	}
}
package com.spring.Modal;

import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
@Entity
@Embeddable
public class Dish {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int id;
	
	
	private int did;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
}

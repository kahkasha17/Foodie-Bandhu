package com.spring.Modal;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.beans.factory.annotation.Value;

@Entity
@Table(name="tblOrder")
public class AddOrder {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sr;
	private String fname;
	private String lname;
	private String uid;
	private String addr;
	@OneToMany
	private List<Dish> did=new ArrayList<>();
	@OneToMany
	private List<Quantity> qty= new ArrayList<>();
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastmodified;
	@Value("Not Deliver")
	private String status;
	@Override
	public String toString() {
		return "AddOrder [sr=" + sr + ", fname=" + fname + ", lname=" + lname + ", uid=" + uid + ", addr=" + addr
				+ ", did=" + did + ", qty=" + qty + ", lastmodified=" + lastmodified + ", status=" + status + "]";
	}
	public int getSr() {
		return sr;
	}
	public void setSr(int sr) {
		this.sr = sr;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public List<Dish> getDid() {
		return did;
	}
	public void setDid(List<Dish> did) {
		this.did = did;
	}
	public List<Quantity> getQty() {
		return qty;
	}
	public void setQty(List<Quantity> qty) {
		this.qty = qty;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	
	 
	public Date getLastmodified() {
		return lastmodified;
	}
	public void setLastmodified(Date lastmodified) {
		this.lastmodified = lastmodified;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

}

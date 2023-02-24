package com.spring.Modal;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="tblAdminRegis")
public class Admin {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	 private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getPhn() {
		return phn;
	}
	
	public void setPhn(String phn) {
		this.phn = phn;
	}
	public String getMail() {
		return mail;
	}
	
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getUcode() {
		return ucode;
	}
	
	public void setUcode(String ucode) {
		
		this.ucode = ucode;
	}
	public Date getLastmodified() {
		return lastmodified;
	}
	public void setLastmodified(Date lastmodified) {
		this.lastmodified = lastmodified;
	}
	private String addr;
	private String salary;
	private String designation;
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", addr=" + addr + ", fname=" + fname + ", lname=" + lname + ", phn=" + phn
				+ ", mail=" + mail + ", pw=" + pw + ", ucode=" + ucode + ", lastmodified=" + lastmodified + "]";
	}
	
	 private String fname;
	 private String lname;
	 private String phn;
	 private String mail;
	 private String pw;
	 private String ucode;
	 @Temporal(TemporalType.TIMESTAMP)
	private Date lastmodified;
	
	
	
	
	
	
		
	

}

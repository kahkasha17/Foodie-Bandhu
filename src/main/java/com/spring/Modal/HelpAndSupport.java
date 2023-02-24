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
@Table(name="tblhelpandSupport")
public class HelpAndSupport {
	@Id
	@GeneratedValue(strategy =GenerationType.AUTO )
	private int sr;
	private String fname;
	private String lname;
	private String email;
	private String hlpsprtid;
	private String uid;
	
	private boolean status;
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getHlpsprtid() {
		return hlpsprtid;
	}
	public void setHlpsprtid(String hlpsprtid) {
		this.hlpsprtid = hlpsprtid;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "HelpAndSupport [sr=" + sr + ", fname=" + fname + ", lname=" + lname + ", email=" + email
				+ ", hlpsprtid=" + hlpsprtid + ", uid=" + uid + ", mob=" + mob + ", qta=" + qta + ", lastmodified="
				+ lastmodified + "]";
	}
	private String mob;
	private String qta;
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastmodified;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMob() {
		return mob;
	}
	public void setMob(String mob) {
		this.mob = mob;
	}
	public String getQta() {
		return qta;
	}
	public void setQta(String qta) {
		this.qta = qta;
	}
	public Date getLastmodified() {
		return lastmodified;
	}
	public void setLastmodified(Date lastmodified) {
		this.lastmodified = lastmodified;
	}

}

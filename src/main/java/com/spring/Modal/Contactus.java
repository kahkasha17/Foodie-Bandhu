package com.spring.Modal;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="tblContactus")
public class Contactus {
	@Id
	@GeneratedValue
	private int sr;
	
	private String name;
	private String email;
	private String options;
	private String mobile; 
	private String qta;
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastmodified; 
	private String Qid;
	
	private boolean status;
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public int getSr() {
		return sr;
	}
	@Override
	public String toString() {
		return "Contactus [sr=" + sr + ", name=" + name + ", email=" + email + ", options=" + options + ", mobile="
				+ mobile + ", qta=" + qta + ", lastmodified=" + lastmodified + ", Qid=" + Qid + "]";
	}
	public void setSr(int sr) {
		this.sr = sr;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
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
	
	public String getQid() {
		return Qid;
	}
	public void setQid(String qid) {
		Qid = qid;
	}

}

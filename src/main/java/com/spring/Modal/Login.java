package com.spring.Modal;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="tblLogin")
public class Login  {
	@Id
	@GeneratedValue
	 private int sr;
	 private String Username;
	 private String mail;
	 private String pw;
	 private String uid;
	 @Temporal(TemporalType.TIMESTAMP)
		private Date lastmodified;
	
	@Override
	public String toString() {
		return "Login [sr=" + sr + ", Username=" + Username + ", mail=" + mail + ", pw=" + pw + ", uid=" + uid
				+ ", lastmodified=" + lastmodified + "]";
	}
	public Date getLastmodified() {
		return lastmodified;
	}
	public void setLastmodified(Date lastmodified) {
		this.lastmodified = lastmodified;
	}
	public int getSr() {
		return sr;
	}
	public void setSr(int sr) {
		this.sr = sr;
	}
	public String getUsername() {
		return Username;
	}
	public void setUsername(String username) {
		Username = username;
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
	public String getUid() {
		return uid;
	}
	public void setCid(String uid) {
		this.uid = uid;
	}
	 	 
	}

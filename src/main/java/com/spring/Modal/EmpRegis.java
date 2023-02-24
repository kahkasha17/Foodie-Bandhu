package com.spring.Modal;

import java.util.Arrays;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.springframework.web.multipart.commons.CommonsMultipartFile;



@Entity
@Table(name="tblEmpRegis")
public class EmpRegis {
	
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
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	 int id;
	 private String fname;
	 private String lname;
	 private String phn;
	 private String mail;
	 private String pw;
	 private String addr;
	 private String designation;
	 private String salary;
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

	private String ucode;
	 @Temporal(TemporalType.TIMESTAMP)
	private Date lastmodified;
	public Date getLastmodified() {
		return lastmodified;
	}
	public void setLastmodified(Date lastmodified) {
		this.lastmodified = lastmodified;
	}
	@Override
	public String toString() {
		return "EmpRegis [id=" + id + ", fname=" + fname + ", lname=" + lname + ", phn=" + phn + ", mail=" + mail
				+ ", pw=" + pw + ", addr=" + addr + ", designation=" + designation + ", salary=" + salary + ", ucode="
				+ ucode + ", lastmodified=" + lastmodified + ", resume=" + resume + ", resumee="
				+ Arrays.toString(resumee) + "]";
	}
	
	
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	
	@Transient
	private CommonsMultipartFile resume;
	public CommonsMultipartFile getResume() {
		return resume;
	}
	public void setResume(CommonsMultipartFile resume) {
		try
		{
			
			byte[] b=resume.getBytes();
			setResumee(b);
		}catch (Exception e) {
			System.out.println(e);
		}
		this.resume = resume;
	}
	@Column(name="Resume")
	@Lob
	private byte[] resumee;
	public byte[] getResumee() {
		return resumee;
	}
	public void setResumee(byte[] resumee) {
		this.resumee = resumee;
	}

}

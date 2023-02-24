package com.spring.Modal;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
@Entity
@Table
public class BookTable 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int tableid;
	
	@Column
	private int userID;
	
	@Column
	private String userName;
	
	@Column
	private String userMail;
	
	@Column
	private String floor;
	
	@Column
	private String floorsTime;
	
	@Column
	private String timeInHour;
	
	@Column
	private int noOfSeats;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern ="yyyy-MM-dd")
	private Date bookingDate;
	
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date bookingSlot;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date bookingTime;

	public int getTableid() {
		return tableid;
	}

	public void setTableid(int tableid) {
		this.tableid = tableid;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public String getFloor() {
		return floor;
	}

	public void setFloor(String floor) {
		this.floor = floor;
	}

	public int getNoOfSeats() {
		return noOfSeats;
	}

	public void setNoOfSeats(int noOfSeats) {
		this.noOfSeats = noOfSeats;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}

	public Date getBookingSlot() {
		return bookingSlot;
	}

	public void setBookingSlot(Date bookingSlot) {
		this.bookingSlot = bookingSlot;
	}

	public Date getBookingTime() {
		return bookingTime;
	}

	public void setBookingTime(Date bookingTime) {
		this.bookingTime = bookingTime;
	}

	public BookTable() {
		super();
	}
	

	
	
}

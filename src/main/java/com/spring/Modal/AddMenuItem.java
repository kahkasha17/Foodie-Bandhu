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

import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


@Controller
@Entity
@Table(name = "tbl_Add_item")
public class AddMenuItem 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int imgId;
	
	@Column
	private String dishName;
	@Column
	private String dishType;
	@Column
	private int price;
	
	@Column
	private String qty;
	
	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	@Transient
	private CommonsMultipartFile dishImg;
	
	@Lob
	private byte[] byteImg; 
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date lastmodified;

	
	public int getImgId() {
		return imgId;
	}

	public void setImgId(int imgId) {
		this.imgId = imgId;
	}

	public String getDishName() {
		return dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public String getDishType() {
		return dishType;
	}

	public void setDishType(String dishType) {
		this.dishType = dishType;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public CommonsMultipartFile getDishImg() {
		return dishImg;
	}

	public void setDishImg(CommonsMultipartFile dishImg) 
	{
		byte[] b=dishImg.getBytes();
		setByteImg(b);
	}

	public byte[] getByteImg() {
		return byteImg;
	}

	public void setByteImg(byte[] byteImg) {
		this.byteImg = byteImg;
	}

	public Date getLastmodified() {
		return lastmodified;
	}

	public void setLastmodified(Date lastmodified) {
		this.lastmodified = lastmodified;
	}

	
	@Override
	public String toString() {
		return "AddMenuItem [imgId=" + imgId + ", dishName=" + dishName + ", dishType=" + dishType + ", price=" + price
				+ ", qty=" + qty + ", dishImg=" + dishImg + ", byteImg=" + Arrays.toString(byteImg) + ", lastmodified="
				+ lastmodified + "]";
	}

	public AddMenuItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}

package com.techelevator.campsitereservation.model;

import java.time.LocalDate;

public class Park {
	
	private int parkId;
	private String parkName;
	private String parkLocation;
	private LocalDate establishDate;
	private int area;
	private int vistorsPerYear;
	private String parkDescription;
	
	public int getParkId() {
		return parkId;
	}
	
	public void setParkId(int parkId) {
		this.parkId = parkId;
	}
	public String getParkName() {
		return parkName;
	}
	public void setParkName(String parkName) {
		this.parkName = parkName;
	}
	public String getParkLocation() {
		return parkLocation;
	}
	public void setParkLocation(String parkLocation) {
		this.parkLocation = parkLocation;
	}
	public LocalDate getEstablishDate() {
		return establishDate;
	}
	public void setEstablishDate(LocalDate establishDate) {
		this.establishDate = establishDate;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getVistorsPerYear() {
		return vistorsPerYear;
	}
	public void setVistorsPerYear(int vistorsPerYear) {
		this.vistorsPerYear = vistorsPerYear;
	}
	public String getParkDescription() {
		return parkDescription;
	}
	public void setParkDescription(String parkDescription) {
		this.parkDescription = parkDescription;
	}
	

}

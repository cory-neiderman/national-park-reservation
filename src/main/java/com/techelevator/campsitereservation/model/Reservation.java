package com.techelevator.campsitereservation.model;

import java.time.LocalDate;
import java.time.Period;

public class Reservation {

	private long reservationId;
	private int siteId;
	private int campsiteNumber;
	private String campgroundName;
	private String name;
	private LocalDate fromDate;
	private LocalDate toDate;
	private LocalDate createDate;
	private Period reservationPeriod;
	
	
	
	

	public long getReservationId() {
		return reservationId;
		
	}
	public void setReservationId(Long reservationId) {
		this.reservationId = reservationId;
	}
	public int getSiteId() {
		return siteId;
	}
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public LocalDate getFromDate() {
		return fromDate;
	}
	public String getFromDateAsString(){
		return fromDate.toString();
	}
	public void setFromDate(LocalDate fromDate) {
		this.fromDate = fromDate;
	}
	public LocalDate getToDate() {
		return toDate;
	}
	public String getToDateAsString(){
		return toDate.toString();
	}	
	public void setToDate(LocalDate toDate) {
		this.toDate = toDate;
	}
	public LocalDate getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDate createDate) {
		this.createDate = createDate;
	}
	public String getCampgroundName() {
		return campgroundName;
	}
	public void setCampgroundName(String campgroundName) {
		this.campgroundName = campgroundName;
	}
	public int getCampsiteNumber() {
		return campsiteNumber;
	}
	public void setCampsiteNumber(int campsiteNumber) {
		this.campsiteNumber = campsiteNumber;
	}
	
	/*public Period getReservationPeriod(){
		
		reservationPeriod = Period.between(startDate, endDate);
		return reservationPeriod;
		
	}*/
	
	

}

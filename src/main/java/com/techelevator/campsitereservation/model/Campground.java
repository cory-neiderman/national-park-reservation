package com.techelevator.campsitereservation.model;

public class Campground {
	
	private int campgroundId;
	private int parkId;
	private String campgroundName;
	private double dailyFee;
	private int totalNumberOfSites;
	private int openFrom;
	private int openTo;
	
	public int getCampgroundId() {
		return campgroundId;
	}
	public void setCampgroundId(int campgroundId) {
		this.campgroundId = campgroundId;
	}
	public int getParkId() {
		return parkId;
	}
	public void setParkId(int parkId) {
		this.parkId = parkId;
	}
	public String getCampgroundName() {
		return campgroundName;
	}
	public void setCampgroundName(String campgroundName) {
		this.campgroundName = campgroundName;
	}
	public double getDailyFee() {
		return dailyFee;
	}
	public void setDailyFee(double dailyFee) {
		this.dailyFee = dailyFee;
	}
	public int getOpenFrom() {
		return openFrom;
	}
	public void setOpenFrom(int openFrom) {
		this.openFrom = openFrom;
	}
	public int getOpenTo() {
		return openTo;
	}
	public void setOpenTo(int openTo) {
		this.openTo = openTo;
	}
	public int getTotalNumberOfSites() {
		return totalNumberOfSites;
	}
	public void setTotalNumberOfSites(int totalNumberOfSites) {
		this.totalNumberOfSites = totalNumberOfSites;
	}
	
	
	

}

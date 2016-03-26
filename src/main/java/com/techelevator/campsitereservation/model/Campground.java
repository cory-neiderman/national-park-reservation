package com.techelevator.campsitereservation.model;

public class Campground {
	
	private int campgroundId;
	private int parkId;
	private String campgroundName;
	private double dailyFee;
	private int totalNumberOfSites;
	private int openFrom;
	private int openTo;
	
	public boolean getHasClosedMonths() {
		if ((openTo - openFrom) != 11) {
			return true;
		}
		return false;
	}
	
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
	public String getOpenFromAsString() {
		String monthString = "";
		
		switch (openFrom) {
		case 1:
			monthString = "January";
			break;
		case 2:
			monthString = "February";
			break;
		case 3:
			monthString = "March";
			break;
		case 4:
			monthString = "April";
			break;
		case 5:
			monthString = "May";
			break;
		case 6:
			monthString = "June";
			break;
		case 7:
			monthString = "July";
			break;
		case 8:
			monthString = "August";
			break;
		case 9:
			monthString = "September";
			break;
		case 10:
			monthString = "October";
			break;
		case 11:
			monthString = "November";
			break;
		case 12:
			monthString = "December";
			break;

		}
		
		return monthString;
	}
	
	public String getOpenToAsString() {
		String monthString = "";
		
		switch (openTo) {
		case 1:
			monthString = "January";
			break;
		case 2:
			monthString = "February";
			break;
		case 3:
			monthString = "March";
			break;
		case 4:
			monthString = "April";
			break;
		case 5:
			monthString = "May";
			break;
		case 6:
			monthString = "June";
			break;
		case 7:
			monthString = "July";
			break;
		case 8:
			monthString = "August";
			break;
		case 9:
			monthString = "September";
			break;
		case 10:
			monthString = "October";
			break;
		case 11:
			monthString = "November";
			break;
		case 12:
			monthString = "December";
			break;

		}
		
		return monthString;
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

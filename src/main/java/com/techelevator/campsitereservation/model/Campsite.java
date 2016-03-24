package com.techelevator.campsitereservation.model;

public class Campsite {
	
	private int siteId;
	private int campgroundId;
	private int siteNumber;
	private int maxOccupancy;
	private boolean isHandicapAccessible;
	private int maxReserveLength;
	private boolean hasUtilities;
	
	
	public int getSiteId() {
		return siteId;
	}
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}
	public int getCampgroundId() {
		return campgroundId;
	}
	public void setCampgroundId(int campgroundId) {
		this.campgroundId = campgroundId;
	}
	public int getSiteNumber() {
		return siteNumber;
	}
	public void setSiteNumber(int siteNumber) {
		this.siteNumber = siteNumber;
	}
	public int getMaxOccupancy() {
		return maxOccupancy;
	}
	public void setMaxOccupancy(int maxOccupancy) {
		this.maxOccupancy = maxOccupancy;
	}
	public boolean isHandicapAccessible() {
		return isHandicapAccessible;
	}
	public void setHandicapAccessible(boolean isHandicapAccessible) {
		this.isHandicapAccessible = isHandicapAccessible;
	}
	public int getMaxReserveLength() {
		return maxReserveLength;
	}
	public void setMaxReserveLength(int maxReserveLength) {
		this.maxReserveLength = maxReserveLength;
	}
	public boolean isHasUtilities() {
		return hasUtilities;
	}
	public void setHasUtilities(boolean hasUtilities) {
		this.hasUtilities = hasUtilities;
	}
	

}

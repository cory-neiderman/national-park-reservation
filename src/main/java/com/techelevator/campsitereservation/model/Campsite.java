package com.techelevator.campsitereservation.model;

import java.util.List;

public class Campsite {
	
	private int siteId;
	private int campgroundId;
	private int siteNumber;
	private int maxOccupancy;
	private boolean isHandicapAccessible;
	private int maxRVLength;
	private boolean hasUtilities;
	private ReservationList reservations;
	
	
	
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
	public boolean getIsHandicapAccessible() {
		return isHandicapAccessible;
	}
	public void setIsHandicapAccessible(boolean isHandicapAccessible) {
		this.isHandicapAccessible = isHandicapAccessible;
	}
	
	public int getMaxRVLength() {
		return maxRVLength;
	}
	public void setMaxRVLength(int maxRVLength) {
		this.maxRVLength = maxRVLength;
	}
	public boolean getHasUtilities() {
		return hasUtilities;
	}
	public void setHasUtilities(boolean hasUtilities) {
		this.hasUtilities = hasUtilities;
	}
	public ReservationList getReservations() {
		return reservations;
	}
	public void setReservations(ReservationList reservations) {
		this.reservations = reservations;
	}
	
	
}
	
	
	



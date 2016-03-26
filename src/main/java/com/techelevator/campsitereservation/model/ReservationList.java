package com.techelevator.campsitereservation.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class ReservationList {
	private int campsiteId;
	private int campgroundId;
	private List<Reservation> reservations;
	
	
	public ReservationList(){
		reservations = new ArrayList<>();
	}
	
	public void addReservation(Reservation reservation){
		reservations.add(reservation);
	}
	
	public boolean isDateAvailable(LocalDate startDateDesired, LocalDate endDateDesired){
		
		for(Reservation r: reservations){
			if((startDateDesired.isAfter(r.getFromDate()) || startDateDesired.equals(r.getFromDate())) && (startDateDesired.isBefore(r.getToDate()) || startDateDesired.equals(r.getFromDate()))){
				return false;
			}
			
			if((endDateDesired.isAfter(r.getFromDate()) || endDateDesired.equals(r.getFromDate())) && (endDateDesired.isBefore(r.getToDate()) || endDateDesired.equals(r.getFromDate()))){
				return false;
			}
			
			
		}
		
		
		return true;
	}
	

}


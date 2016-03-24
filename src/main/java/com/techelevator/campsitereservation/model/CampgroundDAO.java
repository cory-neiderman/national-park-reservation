package com.techelevator.campsitereservation.model;

import java.util.List;

public interface CampgroundDAO {
	
	public List<Campground> findCampgroundByParkId(int parkId);
	
}

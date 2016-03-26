package com.techelevator.campsitereservation.model;

import java.util.List;

public interface CampsiteDAO {
	
	public List<Campsite> findCampsitesAvailable(int campgroundId, String startDate, String endDate);

}

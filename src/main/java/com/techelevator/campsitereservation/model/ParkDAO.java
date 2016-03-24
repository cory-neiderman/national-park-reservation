package com.techelevator.campsitereservation.model;

import java.util.List;

public interface ParkDAO {

		public List<Park> readAllParks();
		public Park findParkByCode(int parkId);
}

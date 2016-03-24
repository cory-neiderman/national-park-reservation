package com.techelevator.campsitereservation.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.campsitereservation.model.CampgroundDAO;
import com.techelevator.campsitereservation.model.JDBCCampgroundDAO;
import com.techelevator.campsitereservation.model.JDBCParkDAO;
import com.techelevator.campsitereservation.model.ParkDAO;

@Controller
public class CampgroundController {
	
	CampgroundDAO campgroundDAO;
	
	@Autowired
	public CampgroundController(JDBCCampgroundDAO campgroundDAO){
		this.campgroundDAO = campgroundDAO;
	}
	
	@RequestMapping(path="/parkCampgroundDetail", method=RequestMethod.GET)
	public String displayMainPage(Map<String, Object> model,
									@RequestParam(name="parkId") int parkId,
									@RequestParam(name="parkChosenName") String parkChosenName){
		
		
		//model.put("parkChosenId", parkId);
		model.put("parkChosenName", parkChosenName);
		model.put("listOfCampgrounds", campgroundDAO.findCampgroundByParkId(parkId));
		
		return "parkCampgroundDetail";
	}

}

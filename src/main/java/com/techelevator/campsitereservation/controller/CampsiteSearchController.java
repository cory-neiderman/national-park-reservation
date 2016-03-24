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
public class CampsiteSearchController {
	
	
	@RequestMapping(path="/campsiteSearch", method=RequestMethod.GET)
	public String displayCampsiteSearch(Map<String, Object> model,
											@RequestParam(name="campgroundId") int campgroundId,
											@RequestParam(name="campgroundChosenName") String name){
			
			model.put("campgroundId", campgroundId);
			model.put("campgroundChosenName", name);
			return "campsiteSearch";
	}

}

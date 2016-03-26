package com.techelevator.campsitereservation.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.techelevator.campsitereservation.model.CampgroundDAO;
import com.techelevator.campsitereservation.model.CampsiteDAO;
import com.techelevator.campsitereservation.model.JDBCCampgroundDAO;
import com.techelevator.campsitereservation.model.JDBCCampsiteDAO;
import com.techelevator.campsitereservation.model.JDBCParkDAO;
import com.techelevator.campsitereservation.model.ParkDAO;

@Controller
public class CampsiteSearchController {
	
	CampsiteDAO campsiteDAO;
	
	@Autowired
	public CampsiteSearchController(JDBCCampsiteDAO campsiteDAO){
		this.campsiteDAO = campsiteDAO;
	}
	
	@RequestMapping(path="/campsiteSearch", method=RequestMethod.GET)
	public String displayCampsiteSearch(Map<String, Object> model,
											@RequestParam(name="campgroundChosenName") String name,
											@RequestParam(name="campgroundId") int campgroundId){
			
			model.put("campgroundId", campgroundId);
			model.put("campgroundChosenName", name);
			return "campsiteSearch";
	}
	
	@RequestMapping(path="/searchForSites", method=RequestMethod.GET)
	public String displayCampsiteSearch(Map<String, Object> model,
										@RequestParam(name="campgroundId") int campgroundId,
										@RequestParam(name="campgroundChosenName") String campgroundChosenName,
										@RequestParam(name="startDateChosen") String startDateChosen,
										@RequestParam(name="endDateChosen") String endDateChosen
										/*@RequestParam(name="accessible") Boolean accessible,
										@RequestParam(name="utilities") Boolean utilities,
										@RequestParam(name="rvLength") int rvLength*/){
			
			model.put("campgroundChosenName", campgroundChosenName);
			model.put("campgroundId", campgroundId);
			model.put("startDateChosen", startDateChosen);
			model.put("endDateChosen", endDateChosen);
			
			model.put("listOfSites", campsiteDAO.findCampsitesAvailable(campgroundId, startDateChosen, endDateChosen));
			
			return "campsiteSearchResults";
	}

}

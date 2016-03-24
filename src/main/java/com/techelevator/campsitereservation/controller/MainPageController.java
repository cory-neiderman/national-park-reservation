package com.techelevator.campsitereservation.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.techelevator.campsitereservation.model.JDBCParkDAO;
import com.techelevator.campsitereservation.model.ParkDAO;

@Controller
public class MainPageController {
	
	ParkDAO parkDAO;
	
	@Autowired
	public MainPageController(JDBCParkDAO parkDAO){
		this.parkDAO = parkDAO;
	}
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayMainPage(Map<String, Object> model){
		
		model.put("listOfParks", parkDAO.readAllParks());
		
		return "mainPage";
	}

}
package com.techelevator.campsitereservation.controller;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.campsitereservation.model.CampgroundDAO;
import com.techelevator.campsitereservation.model.CampsiteDAO;
import com.techelevator.campsitereservation.model.JDBCCampgroundDAO;
import com.techelevator.campsitereservation.model.JDBCCampsiteDAO;
import com.techelevator.campsitereservation.model.JDBCParkDAO;
import com.techelevator.campsitereservation.model.JDBCReservationDAO;
import com.techelevator.campsitereservation.model.ParkDAO;
import com.techelevator.campsitereservation.model.Reservation;
import com.techelevator.campsitereservation.model.ReservationDAO;

@Controller
@Transactional
@SessionAttributes("reservation")
public class CampsiteReservationController {
	
	private ReservationDAO reservationDAO;
	
	@Autowired
	public CampsiteReservationController(JDBCReservationDAO reservationDAO) {
		this.reservationDAO = reservationDAO;
		
	}
	
	
	@RequestMapping(path="/reserveForm", method=RequestMethod.GET)
	public String displayReservationForm(Map<String, Object> model,
											@RequestParam(name="campsiteId") int campsiteId,
											@RequestParam(name="startDateChosen") String startDateChosen,
											@RequestParam(name="endDateChosen") String endDateChosen,
											@RequestParam(name="campsiteNumber") String campsiteNumber,
											@RequestParam(name="campgroundChosenName") String campgroundChosenName){
			
			model.put("campsiteId", campsiteId);
			model.put("startDateChosen", startDateChosen);
			model.put("endDateChosen", endDateChosen);
			model.put("campsiteNumber", campsiteNumber);
			model.put("campgroundChosenName", campgroundChosenName);
			Reservation reservation = new Reservation();
			reservation.setFromDate(LocalDate.parse(startDateChosen));
			reservation.setToDate(LocalDate.parse(endDateChosen));
			reservation.setCreateDate(LocalDate.now());
			reservation.setSiteId(campsiteId);
			reservation.setCampgroundName(campgroundChosenName);
			
			model.put("reservation", reservation);
			
			return "reserveForm";
	}
	
	@RequestMapping(path="/reservationSubmit", method=RequestMethod.POST)
	public String processReservationConfirmation(Map<String, Object> model,
													@RequestParam(name="reservationName") String reservationName){
			 
			model.put("reservationName", reservationName);
			
			Reservation reservation = (Reservation)model.get("reservation");
			reservation.setName(reservationName);
			
			reservationDAO.save(reservation);
		
			return "redirect:/reservationConfirmation";
	}
	@RequestMapping(path="/reservationConfirmation", method=RequestMethod.GET)
	public String displayReservationConfirmation(){
		return "reservationConfirmation";
		
		
		
		
		
		
		
		
		
		
	}
}
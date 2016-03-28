package com.techelevator.campsitereservation.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCCampsiteDAO implements CampsiteDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCCampsiteDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public List<Campsite> findCampsitesAvailable(int campgroundId, String startDate, String endDate) {
		
		LocalDate fromDate = LocalDate.parse(startDate);
		LocalDate toDate = LocalDate.parse(endDate);
		
		List<Campsite> campsiteList = new ArrayList<>();
		
		String sqlQueryCampsite = "SELECT site.site_id, site.campground_id, site.site_number, site.max_occupancy,"
										+ "site.accessible, site.max_rv_length, site.utilities  "
										+"FROM site "+ "WHERE site.campground_id = ?";
		
		int searchId = campgroundId;
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQueryCampsite, searchId);
		
		while (results.next()) {
			Campsite campsite = new Campsite();
			campsite.setSiteId(results.getInt("site_id"));
			campsite.setCampgroundId(results.getInt("campground_id"));
			campsite.setSiteNumber(results.getInt("site_number"));
			campsite.setMaxOccupancy(results.getInt("max_occupancy"));
			campsite.setIsHandicapAccessible(results.getBoolean("accessible"));
			campsite.setHasUtilities(results.getBoolean("utilities"));
			campsite.setMaxRVLength(results.getInt("max_rv_length"));
			
			ReservationList reservations = new ReservationList();
			
			String sqlQueryReservation = "SELECT reservation.reservation_id, reservation.site_id, reservation.name, "
					+ "reservation.from_date, reservation.to_date, reservation.create_date  "
					+"FROM reservation "+ "WHERE reservation.site_id = ?";
			
			int siteId = results.getInt("site_id");
			
			SqlRowSet resultsReservation = jdbcTemplate.queryForRowSet(sqlQueryReservation, siteId);
			
			while(resultsReservation.next()){
				Reservation reservation = new Reservation();
				reservation.setReservationId(resultsReservation.getLong("reservation_id"));
				reservation.setSiteId(siteId);
				reservation.setName(resultsReservation.getString("name"));
				reservation.setReservationId(resultsReservation.getLong("reservation_id"));
				reservation.setFromDate(LocalDate.parse(resultsReservation.getString("from_date")));
				reservation.setToDate(LocalDate.parse(resultsReservation.getString("to_date")));
				reservations.addReservation(reservation);

			}
			
			campsite.setReservations(reservations);
			
			if(reservations.isDateAvailable(fromDate, toDate)){
				campsiteList.add(campsite);
			}
			
		
			
			
		}
		return campsiteList;
	}

}

package com.techelevator.campsitereservation.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCCampgroundDAO implements CampgroundDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCCampgroundDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	
	@Override
	public List<Campground> findCampgroundByParkId(int parkId) {
		
		List<Campground> campgroundList = new ArrayList<>();
		
		String sqlQueryCampgroundName = "SELECT campground.name, campground.campground_id, campground.park_id, campground.daily_fee,"
										+ " campground.open_from_mm, campground.open_to_mm  "
										+"FROM campground "+ "WHERE park_id = ?";
		
		int searchId = parkId;
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQueryCampgroundName, searchId);
		
		while (results.next()) {
			Campground newCampground = new Campground();
			newCampground.setParkId(parkId);
			newCampground.setCampgroundName(results.getString("name"));
			newCampground.setDailyFee(results.getDouble("daily_fee"));
			newCampground.setOpenFrom(results.getInt("open_from_mm"));
			newCampground.setOpenTo(results.getInt("open_to_mm"));
			newCampground.setCampgroundId(results.getInt("campground_id"));
			
			String sqlQueryAddUpSites = "SELECT count(*) FROM site WHERE site.campground_id = "+results.getInt("campground_id");
			
			SqlRowSet sumResults = jdbcTemplate.queryForRowSet(sqlQueryAddUpSites);
			
			sumResults.next();
			newCampground.setTotalNumberOfSites(sumResults.getInt("count"));
			
			
			campgroundList.add(newCampground);

		}
		
		
		return campgroundList;
		
		
		
	}
	
	

}

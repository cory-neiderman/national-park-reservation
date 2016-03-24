package com.techelevator.campsitereservation.model;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;


@Component
public class JDBCParkDAO implements ParkDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	
	
	
	@Override
	public List<Park> readAllParks() {
		
		List<Park> parkList = new ArrayList<>();
		
		String sqlQueryParkName = "SELECT park.name, park.park_id "+"FROM park";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQueryParkName);
		
		while (results.next()) {
			Park newPark = new Park();
			newPark.setParkName(results.getString("name"));
			newPark.setParkId(Integer.parseInt(results.getString("park_id")));
			parkList.add(newPark);

		}
		return parkList;
		
	}

	@Override
	public Park findParkByCode(int parkId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}

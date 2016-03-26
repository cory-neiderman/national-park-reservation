package com.techelevator.campsitereservation.model;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

@Component
public class JDBCReservationDAO implements ReservationDAO{
	
	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCReservationDAO(DataSource datasource) {
		jdbcTemplate = new JdbcTemplate(datasource);
	}

	@Override
	public void save(Reservation reservation) {
		
		/*SqlRowSet results = jdbcTemplate.queryForRowSet("SELECT nextval('reservation_reservation_id_seq')");
		results.next();
		Long reservationId = results.getLong(1);*/
		
		String sqlInsertReservation = "INSERT INTO reservation(site_id, name, from_date, to_date, create_date) "+
				"VALUES(?,?,?,?,?)";
		
		jdbcTemplate.update(sqlInsertReservation, reservation.getSiteId(), reservation.getName(), reservation.getFromDate(), reservation.getToDate(), reservation.getCreateDate() );

		
	}

}

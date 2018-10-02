package database;

import java.sql.*;

import database.Connector;
import database.ReservationDetails;

public class Reservation extends Connector {
	public Reservation() throws Exception {
	}

	// add new reservation
	public void addNewReservation(ReservationDetails newReservation) {

		try {
			String sqlStatement = "INSERT INTO reservations (user_id, reserved_date, reserved_time, total_pax, created_date) VALUES (?, ?, ?, ?, sysdate())";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(sqlStatement);
			prepStmt.setInt(1, newReservation.getUserID());
			prepStmt.setDate(2, newReservation.getReservedDate());
			prepStmt.setTime(3, newReservation.getReservedTime());
			prepStmt.setInt(4, newReservation.getTotalPax());
//			prepStmt.setString(5, newReservation.getRemarks());
			prepStmt.executeUpdate();

			prepStmt.close();
			releaseConnection();
		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}

	}
}

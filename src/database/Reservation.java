package database;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import database.Connector;
import database.ReservationDetails;
import exceptions.ReservationsNotFoundException;

public class Reservation extends Connector {
	public Reservation() throws Exception {
	}

	@SuppressWarnings("rawtypes")
	private ArrayList reservations;

	// add new reservation
	public void addNewReservation(ReservationDetails newReservation, int tableID) {
		int reservationID = 0;
		try {
			String sqlStatement = "INSERT INTO reservations (user_id, reserved_date, reserved_time, total_pax) VALUES (?, ?, ?, ?)";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(sqlStatement,PreparedStatement.RETURN_GENERATED_KEYS);
			prepStmt.setInt(1, newReservation.getUserId());
			prepStmt.setDate(2, newReservation.getReservedDate());
			prepStmt.setTime(3, newReservation.getReservedTime());
			prepStmt.setInt(4, newReservation.getTotalPax());
//			prepStmt.setString(5, newReservation.getRemarks());
			prepStmt.executeUpdate();
			ResultSet rs = prepStmt.getGeneratedKeys();
			if(rs.next())
			{
				reservationID = rs.getInt(1);
				
			}
			
			
			//Insert Reservation ID and Table ID mapping.
			
			sqlStatement = "INSERT INTO reservation_tables (reservation_id, table_id) VALUES (?, ?)";
			prepStmt = con.prepareStatement(sqlStatement,PreparedStatement.RETURN_GENERATED_KEYS);
			prepStmt.setInt(1, reservationID);
			prepStmt.setInt(2, tableID);
			prepStmt.executeUpdate();
			
			prepStmt.close();
			releaseConnection();
		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}

	}

	// get reservations list
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getReservations(int userId, boolean isAdmin) throws ReservationsNotFoundException {
		reservations = new ArrayList();

		try {
			getConnection();

			String selectStatement = "select * from reservations";
			if (!isAdmin) {
				selectStatement = "select * from reservations where user_id=?";
			}

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			if (!isAdmin) {
				prepStmt.setInt(1, userId);
			}
			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				ReservationDetails reservation = new ReservationDetails(rs.getInt(1), rs.getInt(2), rs.getDate(3),
						rs.getTime(4), rs.getInt(5), rs.getString(6));

				if (rs.getInt(1) > 0) {
					reservations.add(reservation);
				}
			}

			prepStmt.close();
		} catch (SQLException ex) {
			throw new ReservationsNotFoundException(ex.getMessage());
		}

		releaseConnection();

		return reservations;
	}
	
	//Getting latest reservation made.
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getLastReservation(int userId) throws ReservationsNotFoundException {
		reservations = new ArrayList();
		
		try {
			getConnection();

			String selectStatement = "select id,user_id,reserved_date,reserved_time,total_pax,remarks from reservations where user_id = ? group by id desc";

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setInt(1, userId);
			ResultSet rs = prepStmt.executeQuery();
			rs.next();
			
				ReservationDetails reservation = new ReservationDetails(rs.getInt(1), rs.getInt(2), rs.getDate(3),
						rs.getTime(4), rs.getInt(5), rs.getString(6));

				if (rs.getInt(1) > 0) {
					reservations.add(reservation);
				}
			

			
		} catch (SQLException ex) {
			throw new ReservationsNotFoundException(ex.getMessage());
		}

		releaseConnection();

		return reservations;
	}
	
	//Getting Available Table.
		
		public int getAvailableTable(Date reservedDate, Time reservedTime, int totalPax) throws ReservationsNotFoundException {
			int tableID = 0;
			try {
				getConnection();
				// Getting All Available Tables based on Size
				String selectStatement = "select id from tables where no_of_pax between ? and ? and id not in (SELECT table_id FROM v_reservation_tbl_dtl WHERE reserved_date = ? and reserved_time = ?) ";
				PreparedStatement prepStmt = con.prepareStatement(selectStatement);
				prepStmt.setInt(1, totalPax);
				prepStmt.setInt(2, totalPax+1);
				prepStmt.setString(3, reservedDate.toString());
				prepStmt.setString(4, reservedTime.toString());
				ResultSet rs = prepStmt.executeQuery();
			
				if (rs.next())
				{
					tableID = rs.getInt(1);
				}
				prepStmt.close();
			} catch (SQLException ex) {
				throw new ReservationsNotFoundException(ex.getMessage());
			}

			releaseConnection();

			return tableID;
		}
}

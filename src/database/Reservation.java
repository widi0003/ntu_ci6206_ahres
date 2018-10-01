package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import database.Connector;
import database.ReservationDetails;
import exceptions.ReservationsNotFoundException;

public class Reservation extends Connector {
	public Reservation() throws Exception {
	}

	@SuppressWarnings("rawtypes")
	private ArrayList reservations;

	// get menu
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getReservations() throws ReservationsNotFoundException {
		reservations = new ArrayList();

		try {
			String selectStatement = "select r.id as reservation_id,\n" + "u.name as user_name,\n"
					+ "u.contact_no as user_contact_no,\n" + "u.email as user_email,\n"
					+ "r.reserved_date as reserved_date,\n" + "r.reserved_time as reserved_time,\n"
					+ "r.total_pax as total_pax,\n" + "r.remarks as remarks,\n" + "t.id as table_id,\n"
					+ "t.no_of_pax as table_capacity\n" + "from reservations r join users u\n" + "on r.user_id = u.id\n"
					+ "join reservation_tables rt on r.id = rt.reservation_id\n"
					+ "join tables t on rt.table_id = t.id\n" + "where cancelled_date is null";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				ReservationDetails reservation = new ReservationDetails(rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getDate(5), rs.getTime(6), rs.getInt(7), rs.getString(8), rs.getInt(9),
						rs.getInt(10));

				if (rs.getInt(1) > 0) {
					reservations.add(reservation);
				}
			}

			prepStmt.close();
		} catch (SQLException ex) {
			throw new ReservationsNotFoundException(ex.getMessage());
		}

		releaseConnection();
		Collections.sort(reservations);

		return reservations;
	}
}

package database;

import java.sql.Date;
import java.sql.Time;

public class ReservationDetails {
	private int user_id = 0;
	private Date reserved_date = null;
	private Time reserved_time = null;
	private int total_pax = 0;
//	private String remarks = null;

	public ReservationDetails() {

	}

	public ReservationDetails(int user_id, Date reserved_date, Time reserved_time, int total_pax) {
		this.user_id = user_id;
		this.reserved_date = reserved_date;
		this.reserved_time = reserved_time;
		this.total_pax = total_pax;
//		this.remarks = remarks;
	}

	public int getUserID() {
		return this.user_id;
	}

	public Date getReservedDate() {
		return this.reserved_date;
	}

	public Time getReservedTime() {
		return this.reserved_time;
	}

	public int getTotalPax() {
		return this.total_pax;
	}

//	public String getRemarks() {
//		return this.remarks;
//	}

}

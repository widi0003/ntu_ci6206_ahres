package database;

import java.sql.Date;
import java.sql.Time;

public class ReservationDetails {
	private int id = 0;
	private int userId = 0;
	private Date reservedDate = null;
	private Time reservedTime = null;
	private int totalPax = 0;
	private String remarks = null;

	public ReservationDetails() {

	}

	public ReservationDetails(int id, int userId, Date reservedDate, Time reservedTime, int totalPax, String remarks) {
		this.id = id;
		this.userId = userId;
		this.reservedDate = reservedDate;
		this.reservedTime = reservedTime;
		this.totalPax = totalPax;
		this.remarks = remarks;
	}

	public int getId() {
		return this.id;
	}

	public int getUserId() {
		return this.userId;
	}

	public Date getReservedDate() {
		return this.reservedDate;
	}

	public Time getReservedTime() {
		return this.reservedTime;
	}

	public int getTotalPax() {
		return this.totalPax;
	}

	public String getRemarks() {
		return this.remarks;
	}

	public int compareTo(Object o) {
		ReservationDetails n = (ReservationDetails) o;
		return Integer.compare(id, n.id);
	}

}

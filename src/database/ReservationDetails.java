package database;

import java.sql.Time;
import java.util.Date;

@SuppressWarnings({ "rawtypes" })
public class ReservationDetails implements Comparable {
	private int reservation_id = 0;
	private String user_name = null;
	private String user_contact_no = null;
	private String user_email = null;
	private Date reserved_date = null;
	private Time reserved_time = null;
	private int total_pax = 0;
	private String remarks = null;
	private int table_id = 0;
	private int table_capacity = 0;

	public ReservationDetails() {
	}

	public ReservationDetails(int reservation_id, String user_name, String user_contact_no, String user_email,
			Date reserved_date, Time reserved_time, int total_pax, String remarks, int table_id, int table_capacity) {
		this.reservation_id = reservation_id;
		this.user_name = user_name;
		this.user_contact_no = user_contact_no;
		this.user_email = user_email;
		this.reserved_date = reserved_date;
		this.reserved_time = reserved_time;
		this.total_pax = total_pax;
		this.remarks = remarks;
		this.table_id = table_id;
		this.table_capacity = table_capacity;
	}

	public int getReservationId() {
		return this.reservation_id;
	}

	public String getUserName() {
		return this.user_name;
	}

	public String getUserContactNo() {
		return this.user_contact_no;
	}

	public String getUserEmail() {
		return this.user_email;
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

	public String getRemarks() {
		return this.remarks;
	}

	public int getTableId() {
		return this.table_id;
	}

	public int getTableCapacity() {
		return this.table_capacity;
	}

	public void setReservationId(int reservation_id) {
		this.reservation_id = reservation_id;
	}

	public void setUserName(String user_name) {
		this.user_name = user_name;
	}

	public void setUserContactNo(String user_contact_no) {
		this.user_contact_no = user_contact_no;
	}

	public void setUserEmail(String user_email) {
		this.user_email = user_email;
	}

	public void setReservedDate(Date reserved_date) {
		this.reserved_date = reserved_date;
	}

	public void setReservedTime(Time reserved_time) {
		this.reserved_time = reserved_time;
	}

	public void setTotalPax(int total_pax) {
		this.total_pax = total_pax;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public void setTableId(int table_id) {
		this.table_id = table_id;
	}

	public void setTableCapacity(int table_capacity) {
		this.table_capacity = table_capacity;
	}

	public int compareTo(Object o) {
		ReservationDetails n = (ReservationDetails) o;
		return Integer.compare(reservation_id, n.reservation_id);
	}
}

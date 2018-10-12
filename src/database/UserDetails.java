package database;

import java.sql.Date;

@SuppressWarnings({ "rawtypes" })
public class UserDetails implements Comparable {
	private int id = 0;
	private String type = null;
	private String name = null;
	private String password = null;
	private String contactNo = null;
	private String email = null;
	private Date createdDate = null;

	public UserDetails() {
	}

	public UserDetails(int id, String type, String name, String password, String contactNo, String email,
			Date createdDate) {
		this.id = id;
		this.type = type;
		this.name = name;
		this.password = password;
		this.contactNo = contactNo;
		this.email = email;
		this.createdDate = createdDate;
	}

	public int getId() {
		return this.id;
	}

	public String getType() {
		return this.type;
	}

	public String getName() {
		return this.name;
	}

	public String getPassword() {
		return this.password;
	}

	public String getContactNo() {
		return this.contactNo;
	}

	public String getEmail() {
		return this.email;
	}

	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public int compareTo(Object o) {
		UserDetails n = (UserDetails) o;
		int lastCmp = email.compareTo(n.email);

		return (lastCmp);
	}
}

package database;

import java.sql.*;

import database.Connector;

public class User extends Connector {
	public User() throws Exception {
	}

	// authentication for user login
	public boolean authenticate(String email, String password) {
		boolean status = false;
		try {
			String selectStatement = "select * from users where email = ? and password = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);
			prepStmt.setString(2, password);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				status = true;

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return status;
	}

	// get user's name by email
	public String getName(String email) {
		String name = "";
		try {
			String selectStatement = "select name from users where email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				name = rs.getString(1);

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return name;
	}

	// get user's id by email
	public int getId(String email) {
		int id = 0;
		try {
			String selectStatement = "select id from users where email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				id = rs.getInt(1);

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return id;
	}

	// check email validity for new user
	public boolean checkEmail(String email) {
		boolean result = true;

		try {
			String selectStatement = "select * from users where email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				result = false;
			}

			prepStmt.close();
			releaseConnection();
		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}

		return result;
	}

	// check if user admin or not
	public boolean isAdmin(String email) {
		try {
			String selectStatement = "select * from users where type = 'admin' and email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				return true;

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return false;
	}
	
	//get user's created date using email
	public String getCreatedDate(String email) {
		String createdDate = "";
		try {
			String selectStatement = "select created_date from users where email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				createdDate = rs.getString(1);

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return createdDate;
	}
	
	//get user's contact number using email
	public String getContactNo(String email) {
		String contactNumber = "";
		try {
			String selectStatement = "select contact_no from users where email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				contactNumber = rs.getString(1);

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return contactNumber;
	}

	// add new user
	public void addNewUser(String name, String email, String password, String contactNo) {

		try {
			String sqlStatement = "INSERT INTO users (type, name, email, password, contact_no) VALUES ('cust', ?, ?, ?, ?)";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(sqlStatement);
			prepStmt.setString(1, name);
			prepStmt.setString(2, email);
			prepStmt.setString(3, password);
			prepStmt.setString(4, contactNo);
			prepStmt.executeUpdate();

			prepStmt.close();
			releaseConnection();
		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}

	}

}

package database;

import java.sql.*;

import database.Connector;
import database.UserDetails;

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

	public boolean updatePassword(String email, String password) {
		try {
			String updateStatement = "update users set password=?, updated_date=? where email=?";
			getConnection();

			Timestamp date = new Timestamp(new java.util.Date().getTime());

			PreparedStatement prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setString(1, password);
			prepStmt.setTimestamp(2, date);
			prepStmt.setString(3, email);

			System.out.println("Updating email:" + email + " with password:" + password);

			prepStmt.executeUpdate();

			prepStmt.close();
			releaseConnection();

			return true;

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
			return false;
		}
	}

	public boolean updateUserDetails(UserDetails user) {
		try {
			String updateStatement = "update users set name=?, contact_no=?, updated_date=? where email=?";
			getConnection();

			Timestamp date = new Timestamp(new java.util.Date().getTime());

			PreparedStatement prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setString(1, user.getName());
			prepStmt.setString(2, user.getContactNo());
			prepStmt.setTimestamp(3, date);
			prepStmt.setString(4, user.getEmail());

			System.out.println(
					"Updating " + user.getName() + ", " + user.getContactNo() + "," + date + ", " + user.getEmail());

			prepStmt.executeUpdate();

			prepStmt.close();
			releaseConnection();

			return true;

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
			return false;
		}

	}

	// get user's details by email
	public UserDetails getUserDetails(String email) {
		UserDetails user = null;
		try {
			String selectStatement = "select * from users where email = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email);

			ResultSet rs = prepStmt.executeQuery();

			if (rs.next()) {
				user = new UserDetails(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getDate(7));

			}

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		return user;

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

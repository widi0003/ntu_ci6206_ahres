package database;

import java.sql.*;

import database.Connector;

public class User extends Connector {
	public User() throws Exception {
	}

	
	//authentication for user login
	public boolean authenticate(String email_address, String password) {
		boolean status = false;
		try {
			String selectStatement = "select * from users where email_address = ? and password = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email_address);
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
	
	
	//get user's name by email_address
	public String getName(String email_address) {
		String name = "";
		try {
			String selectStatement = "select name from users where email_address = ?";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email_address);

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
	
	//check email_address validity for new user
	public boolean checkemail_address(String email_address) {
		boolean result = true;
		
		try {
			String selectStatement = "select * from users where email_address = ?";
			getConnection();
			
			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			prepStmt.setString(1, email_address);
			
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
	
	//add new user
	public void addNewUser(String name, String email_address, String password) {
		
		try {
			String sqlStatement = "INSERT INTO users (type, name, email_address, password) VALUES ('active', ?, ?, ?)";
			getConnection();
		
			PreparedStatement prepStmt = con.prepareStatement(sqlStatement);
			prepStmt.setString(1, name);
			prepStmt.setString(2, email_address);
			prepStmt.setString(3, password);
			prepStmt.executeUpdate();
			
			prepStmt.close();
			releaseConnection();
		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}
		
		
	}

}

package database;

import java.sql.*;

import database.Connector;

public class User extends Connector {
	public User() throws Exception {
	}

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

}

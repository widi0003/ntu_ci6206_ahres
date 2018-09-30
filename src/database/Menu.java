package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import database.Connector;
import exceptions.MenuNotFoundException;

public class Menu extends Connector {
	@SuppressWarnings("rawtypes")
	private ArrayList menu;

	public Menu() throws Exception {
	}

	// get menu
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getMenu() throws MenuNotFoundException {
		menu = new ArrayList();

		try {
			String selectStatement = "select * from menu";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				MenuDetails menuItem = new MenuDetails(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getInt(7));

				if (rs.getInt(7) > 0) {
					menu.add(menuItem);
				}
			}

			prepStmt.close();
		} catch (SQLException ex) {
			throw new MenuNotFoundException(ex.getMessage());
		}

		releaseConnection();
		Collections.sort(menu);

		return menu;
	}
}

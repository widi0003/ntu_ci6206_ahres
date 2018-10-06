package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import database.FeedbackDetails;
import exceptions.FeedbackNotFoundException;

@SuppressWarnings({ "rawtypes", "unchecked" })
public class Feedback extends Connector {
	public Feedback() throws Exception {

	}

	private ArrayList feedbacks;

	// add new feedback
	public void addNewFeedback(FeedbackDetails newFeedback) {

		try {
			String sqlStatement = "INSERT INTO user_feedback (user_id, comments, rate, show_flag) VALUES (?, ?, ?, ?)";
			getConnection();

			PreparedStatement prepStmt = con.prepareStatement(sqlStatement);

			prepStmt.setInt(1, newFeedback.getUserId());
			prepStmt.setString(2, newFeedback.getComments());
			prepStmt.setInt(3, newFeedback.getRate());
			prepStmt.setString(4, newFeedback.getShowFlag());

			prepStmt.executeUpdate();

			prepStmt.close();
			releaseConnection();

		} catch (SQLException ex) {
			releaseConnection();
			ex.printStackTrace();
		}

	}

	// get all feedbacks
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getAllFeedback() throws FeedbackNotFoundException {
		feedbacks = new ArrayList();

		try {
			getConnection();
			String selectStatement = "select * from user_feedback";
			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				FeedbackDetails feedback = new FeedbackDetails(rs.getInt(1), rs.getInt(2), rs.getString(3),
						rs.getInt(4), rs.getString(5));

				if (rs.getInt(1) > 0) {
					feedbacks.add(feedback);
				}
			}

			prepStmt.close();
		} catch (

		SQLException ex) {
			throw new FeedbackNotFoundException(ex.getMessage());
		}

		releaseConnection();

		return feedbacks;

	}

	// get visible feedbacks
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getVisibleFeedback() throws FeedbackNotFoundException {
		feedbacks = new ArrayList();

		try {
			getConnection();
			String selectStatement = "select * from user_feedback  where show_flag='y'";
			PreparedStatement prepStmt = con.prepareStatement(selectStatement);
			ResultSet rs = prepStmt.executeQuery();

			while (rs.next()) {
				FeedbackDetails feedback = new FeedbackDetails(rs.getInt(1), rs.getInt(2), rs.getString(3),
						rs.getInt(4), rs.getString(5));

				if (rs.getInt(1) > 0) {
					feedbacks.add(feedback);
				}
			}

			prepStmt.close();
		} catch (

		SQLException ex) {
			throw new FeedbackNotFoundException(ex.getMessage());
		}

		releaseConnection();

		return feedbacks;

	}

	// change feedback show flag
	public boolean changeFeedbackShowFlag(FeedbackDetails feedback) throws FeedbackNotFoundException {

		try {
			getConnection();
			String updateStatement = "update user_feedback set show_flag= where id=?\"";

			PreparedStatement prepStmt = con.prepareStatement(updateStatement);
			prepStmt.setString(1, feedback.getShowFlag());
			prepStmt.setInt(2, feedback.getId());

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

}

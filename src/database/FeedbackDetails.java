package database;

public class FeedbackDetails {
	private int id = 0;
	private int userId = 0;
	private String comments = null;
	private int rate = 0;
	private String showFlag = null;

	public FeedbackDetails() {

	}

	public FeedbackDetails(int id, int userId, String comments, int rate, String showFlag) {
		this.id = id;
		this.userId = userId;
		this.comments = comments;
		this.rate = rate;
		this.showFlag = showFlag;
	}
	
	public int getId() {
		return id;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public String getComments() {
		return comments;
	}
	
	public int getRate() {
		return rate;
	}
	
	public String getShowFlag() {
		return showFlag;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public void setRate(int rate) {
		this.rate = rate;
	}
	
	public void setShowFlag(String showFlag) {
		this.showFlag = showFlag;
	}
	
}

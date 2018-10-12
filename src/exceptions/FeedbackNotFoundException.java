package exceptions;

@SuppressWarnings("serial")
public class FeedbackNotFoundException extends Exception {
	public FeedbackNotFoundException() {
	}

	public FeedbackNotFoundException(String msg) {
		super(msg);
	}
}

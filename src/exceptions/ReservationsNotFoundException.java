package exceptions;

@SuppressWarnings("serial")
public class ReservationsNotFoundException extends Exception {
	public ReservationsNotFoundException() {
	}

	public ReservationsNotFoundException(String msg) {
		super(msg);
	}
}

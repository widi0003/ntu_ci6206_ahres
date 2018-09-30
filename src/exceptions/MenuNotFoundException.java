package exceptions;

@SuppressWarnings("serial")
public class MenuNotFoundException extends Exception {
	public MenuNotFoundException() {
	}

	public MenuNotFoundException(String msg) {
		super(msg);
	}
}

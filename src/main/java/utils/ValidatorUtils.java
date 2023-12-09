package utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ValidatorUtils {
	private static final Pattern USERNAME_PATTERN = Pattern.compile("^[a-zA-Z0-9]([._-](?![._-])|[a-zA-Z0-9]){3,18}[a-zA-Z0-9]$");
	private static final Pattern EMAIL_PATTERN = Pattern.compile("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
	private static final Pattern PASSWORD_PATTERN = Pattern.compile("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$");

	
	/*
	 * Start and end with a letter or a digit. 
	 * Have a length between 3 and 18 characters. 
	 * Allow dots, underscores, or hyphens in between characters, but not consecutively.
	 */
	public static boolean isUserNameValid(final String username) {
		Matcher matcher = USERNAME_PATTERN.matcher(username);
		return matcher.matches();
	}

    public static boolean isEmailValid(final String email) {
        Matcher matcher = EMAIL_PATTERN.matcher(email);
        return matcher.matches();
    }
    
	/*
	 * At least 8 characters long. 
	 * At least one lowercase letter. 
	 * At least one uppercase letter. 
	 * At least one digit. 
	 * At least one special character from the set [@ $!%*?&].
	 */
	public static boolean isPasswordValid(final String password) {
		Matcher matcher = PASSWORD_PATTERN.matcher(password);
		return matcher.matches();
	}


}

package servlets.admin;

import jakarta.servlet.RequestDispatcher;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import utils.ValidatorUtils;

@WebServlet({ "/admin-add-user" })
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddUserServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-user.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String errorString = "";
		String userNameMessage = "";
		String emailMessage = "";
		String passwordMessage = "";
		boolean hasError = false;

		String userName = request.getParameter("userName");
		String emailAddress = request.getParameter("emailAddress");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		String passwordRepeat = request.getParameter("passwordRepeat");

		String cityRaw = request.getParameter("city");
		String districtRaw = request.getParameter("district");
		String addressLineRaw = request.getParameter("addressLine");
		String unitNumberRaw = request.getParameter("unitNumber");

		int role = 2;
		try {
			role = Integer.parseInt(request.getParameter("role"));
		} catch (Exception e) {
		}

		if (userName == null || userName.isEmpty() || emailAddress == null || emailAddress.isEmpty()
				|| phoneNumber == null || phoneNumber.isEmpty() || password == null || password.isEmpty()
				|| passwordRepeat == null || passwordRepeat.isEmpty() || cityRaw == null || cityRaw.isEmpty()
				|| districtRaw == null || districtRaw.isEmpty() || addressLineRaw == null || addressLineRaw.isEmpty()
				|| unitNumberRaw == null || unitNumberRaw.isEmpty()) {
			errorString += "Empty values ​​are not allowed! ";
			hasError = true;
		}
		else {
			if (!ValidatorUtils.isUserNameValid(userName)) {
				userNameMessage = 
						"- Username must start and end with a letter or a digit."
						+ " Have a length between 3 and 18 characters."
						+ " Allow dots, underscores, or hyphens in between characters, but not consecutively.";
				hasError = true;
			}
			if (!ValidatorUtils.isEmailValid(emailAddress)) {
				emailMessage = "- Invalid email";
				hasError = true;
			}
			if (!ValidatorUtils.isPasswordValid(password)) {
				passwordMessage = 
						"- Password must: At least 8 characters long,"
						+ " one lowercase letter,"
						+ " one uppercase letter,"
						+ " one digit,"
						+ "	one special character from the set [@ $!%*?&].";
				hasError = true;
			}
			else {
				if (!password.equals(passwordRepeat)) {
					hasError = true;
					passwordMessage = passwordMessage + "Repeated password is incorrect!";
				}
			}
		}
			
		
	

		if (hasError) {
			request.setAttribute("errorString", errorString);
			request.setAttribute("userNameMessage", userNameMessage);
			request.setAttribute("emailMessage", emailMessage);
			request.setAttribute("passwordMessage", passwordMessage);
			
			request.setAttribute("userName", userName);
			request.setAttribute("emailAddress", emailAddress);
			request.setAttribute("phoneNumber", phoneNumber);
			request.setAttribute("city", cityRaw);
			request.setAttribute("district", districtRaw);
			request.setAttribute("addressLine", addressLineRaw);
			request.setAttribute("unitNumber", unitNumberRaw);

			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-user.jsp");
			dispatcher.forward(request, response);
		}

		String city = new String(cityRaw.getBytes(), "UTF-8");
		String district = new String(districtRaw.getBytes(), "UTF-8");
		String addressLine = new String(addressLineRaw.getBytes(), "UTF-8");
		String unitNumber = new String(unitNumberRaw.getBytes(), "UTF-8");
	}

}

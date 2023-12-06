package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet({"/admin-add-user"})
public class AddUserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public AddUserServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/add-user.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String errorString = "";
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
		} catch (Exception e) {}
		
		

		if(userName == null || userName.isEmpty()
				|| emailAddress == null || emailAddress.isEmpty()
				|| phoneNumber == null || phoneNumber.isEmpty()
				|| password == null || password.isEmpty()
				|| passwordRepeat == null || passwordRepeat.isEmpty()
				|| cityRaw == null || cityRaw.isEmpty()
				|| districtRaw == null || districtRaw.isEmpty()
				|| addressLineRaw == null || addressLineRaw.isEmpty()
				|| unitNumberRaw == null || unitNumberRaw.isEmpty())
		{
			errorString += "";
			hasError = true;
		}
		
	
		
		String city = new String(cityRaw.getBytes("ISO-8859-1"), "UTF-8");
		String district = new String(districtRaw.getBytes("ISO-8859-1"), "UTF-8");
		String addressLine = new String(addressLineRaw.getBytes("ISO-8859-1"), "UTF-8");
		String unitNumber = new String(unitNumberRaw.getBytes("ISO-8859-1"), "UTF-8");
		
	}

}

package servlets.admin;

import jakarta.servlet.RequestDispatcher;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import DAO.UserAccountDAO;
import bean.UserAccount;

@WebServlet({"/admin-users",
	"/admin-user/delete"})
public class UsersServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
    
    public UsersServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		try {
			switch (action) {
			case "/admin-user/delete":
				deleteUser(request, response);
				break;
			default:
				listUser(request, response);
				break;	
			}
				
		} catch (Exception  e) {
			throw new ServletException(e);
		}
	}
	
	protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("delete");
		Boolean hasErorr = false;
		int userId = -1;
		try {
			userId = Integer.parseInt(request.getParameter("userId"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		if (userId < 0) {
			hasErorr = true;
		}
		
		if(hasErorr) {
			HttpSession session = request.getSession();
			session.setAttribute("successMessage", "An error occurred, please try again !");
			response.sendRedirect(request.getContextPath() + "/admin-users");			
		}
		else {
			UserAccountDAO userAccountDAO = new UserAccountDAO();
			UserAccount user = userAccountDAO.getUserAccount(userId);
			
			userAccountDAO.deleteUser(userId);
			
			response.sendRedirect(request.getContextPath() + "/admin-users");		
		}
	}
	
	protected void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		UserAccountDAO userAccountDAO = new UserAccountDAO();
		List<UserAccount> listUser = userAccountDAO.listUserAccounts();
		
		request.setAttribute("listUser", listUser);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/views/admin/users.jsp");
		dispatcher.forward(request, response);
	}

}


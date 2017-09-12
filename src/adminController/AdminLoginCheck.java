package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.ValidAdmin;
import modal.Admin;

@WebServlet("/AdminLoginCheck")
public class AdminLoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   String uName=request.getParameter("userName");
	   String pass=request.getParameter("password");
	   Admin admin=new Admin(uName,pass);
	   boolean check=ValidAdmin.validAdmin(admin);
	   if(check)
	   {
		   HttpSession session=request.getSession();
		   session.setAttribute("adminName",uName);
		   response.sendRedirect("adminAccount.jsp");
	   }
	   else
	   {
		   request.getRequestDispatcher("AdminLogin.jsp").include(request,response);
		   response.setContentType("text/html");
		   response.getWriter().print("<script>window.alert('Invalid username or password');</script>");
	   }
	}

}

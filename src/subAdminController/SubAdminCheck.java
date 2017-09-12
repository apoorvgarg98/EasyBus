package subAdminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.SubAdmin;
import subAdminBS.ValidSub;

@WebServlet("/SubAdminCheck")
public class SubAdminCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("userName");
		String pass=request.getParameter("password");
		SubAdmin s=new SubAdmin(uname,pass);
		boolean status=ValidSub.check(s);
		if(status)
		   {
			   HttpSession session=request.getSession();
			   session.setAttribute("subAdminName",uname);
			   response.sendRedirect("subAdminAccount.jsp");
		   }
		   else
		   {
			   request.getRequestDispatcher("SubAdminLogin.jsp").include(request,response);
			   response.setContentType("text/html");
			   response.getWriter().println("<script>window.alert('Invalid username or password');</script>");
		   }
	}

}

package userController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modal.User;
import userBusinessService.CRUD;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname=request.getParameter("uname");
		String pass=request.getParameter("password");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		
		User u =new User(uname,pass,name,email);
		boolean status=CRUD.add(u);
		if(status)
		{
			HttpSession session=request.getSession();
			session.setAttribute("userName",uname);
			response.sendRedirect("index.jsp");
		}
		else
		{
			request.getRequestDispatcher("signup.jsp").include(request,response);
			   response.setContentType("text/html");
			   response.getWriter().println("<script>window.alert('Something went wrong..Try again');</script>");
		}
	}

}

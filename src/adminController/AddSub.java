package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.SubCRUD;
import modal.SubAdmin;

@WebServlet("/AddSub")
public class AddSub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String aname=(String)session.getAttribute("adminName");
		if(aname!=null)
		{
		String uname=request.getParameter("userName");
	 	String pass=request.getParameter("password");
	 	SubAdmin sub=new SubAdmin(uname,pass);
	 	int status=SubCRUD.add(sub);
	 	String mess;
	 	if(status==1)
		{
			request.getRequestDispatcher("adminAccount.jsp").include(request,response);
			mess="SubAdmin details successfully added";
			response.getWriter().println(mess);
		}
		else
		{
			request.getRequestDispatcher("addSub.jsp").include(request,response);
			mess="SubAdmin details couldn't be added.Try again later.";
			response.getWriter().println(mess);
		}
	  }
	}

}

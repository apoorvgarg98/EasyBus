package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.SubCRUD;

@WebServlet("/RemoveSub")
public class RemoveSub extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String aname=(String)session.getAttribute("adminName");
		if(aname!=null)
		{
		String uname=request.getParameter("userName");
		int status=SubCRUD.remove(uname);
		request.getRequestDispatcher("adminAccount.jsp").include(request,response);
		response.setContentType("text/html");
		if(status==1){
			response.getWriter().println("Sub Admin successfully removed");
		}
		else{
			response.getWriter().println("Sub Admin can not be removed.Try again later.");
		}
	  }
	}

}

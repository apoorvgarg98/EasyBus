package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.BusCRUD;

@WebServlet("/DeleteBus")
public class DeleteBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String aname=(String)session.getAttribute("adminName");
		if(aname!=null)
		{
		 String id=request.getParameter("id");
         int status=BusCRUD.delete(id);
         String mess;
         request.getRequestDispatcher("adminAccount.jsp").include(request,response);			
         if(status==1)
 		{
 			mess="Bus details successfully deleted";
 		}
 		else
 		{
 			mess="Bus details couldn't be deleted.Try again later.";
  		}
        response.getWriter().println(mess); 
	
		}
	}

}

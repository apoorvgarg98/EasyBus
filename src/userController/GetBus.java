package userController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.BusCRUD;
import modal.Bus;
import modal.User;
import userBusinessService.CRUD;
import userBusinessService.CheckLimit;
import userBusinessService.TicketCRUD;

@WebServlet("/GetBus")
public class GetBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		HttpSession session=request.getSession();
		String name=(String)session.getAttribute("userName");
		if(name==null)
		{
			   request.getRequestDispatcher("index.jsp").include(request,response);
			   response.setContentType("text/html");
			   response.getWriter().print("<script>window.alert('User not logged in');</script>");
		}
		else
		{
		String id=request.getParameter("busId");
		Bus b=BusCRUD.get(id);
		List<Integer> dis=TicketCRUD.getSeats(id);
		    String uname=(String)session.getAttribute("userName");
		    User u=CRUD.get(uname);
		    long n=CheckLimit.check(u,b);
		    if(n>=5)
		    {
		    	request.getRequestDispatcher("index.jsp").include(request,response);
	            response.setContentType("text/html");
	            response.getWriter().print("<script>window.alert('Limit of seats is reached...Already booked more than 5 seats');</script>");
		    }
		    else if(dis==null || n==-1)
		{
            request.getRequestDispatcher("index.jsp").include(request,response);
            response.setContentType("text/html");
            response.getWriter().print("<script>window.alert('Some error occured... Try again later');</script>");
		}
		else{
			request.setAttribute("bus",b);
			request.setAttribute("dis",dis);
			request.getRequestDispatcher("ViewSeats.jsp").forward(request,response);
		}
	  }
	}

}

package adminController;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.BusCRUD;
import modal.Bus;

@WebServlet("/AddBus")
public class AddBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String aname=(String)session.getAttribute("adminName");
		if(aname!=null)
		{
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String type=request.getParameter("type");
		String start=request.getParameter("start");
		String dest=request.getParameter("dest");
		
	    String dep=request.getParameter("departure");
		dep=dep.replace("T"," ");
		dep+=":00.00";
		String arr=request.getParameter("arrival");
		arr=arr.replace("T"," ");
		arr+=":00.00";
		
		Timestamp departure=Timestamp.valueOf(dep);
		Timestamp arrival=Timestamp.valueOf(arr);
		
		int noSeats=Integer.parseInt(request.getParameter("seats"));
		String desc=request.getParameter("desc");
		Bus b=new Bus(id, name, type, start, dest, departure, arrival, noSeats, desc);
		int status=BusCRUD.add(b);
		response.setContentType("text/html");
		String mess;
		if(status==1)
		{
			request.getRequestDispatcher("adminAccount.jsp").include(request,response);
			mess="Bus details successfully added";
			response.getWriter().println(mess);
		}
		else if(status==-1)
		{
			request.getRequestDispatcher("addBus.jsp").include(request,response);
			response.getWriter().println("<script>window.alert('Bus Id already registered');</script>");
		}
		else
		{
			request.getRequestDispatcher("addBus.jsp").include(request,response);
			mess="Bus details couldn't be added.Try again later.";
			response.getWriter().println(mess);
		}
		
	  }
	}

}

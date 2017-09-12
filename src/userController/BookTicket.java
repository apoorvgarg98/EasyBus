package userController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.BusCRUD;
import modal.Bus;
import modal.Ticket;
import modal.User;
import userBusinessService.CRUD;
import userBusinessService.TicketCRUD;
import utility.StrUtil;

@WebServlet("/BookTicket")
public class BookTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(); 
		String uname=(String)session.getAttribute("userName");
		String busid=request.getParameter("busid");
		Bus b=BusCRUD.get(busid);
		User u=CRUD.get(uname);
		
		String seat=request.getParameter("seat");
		int noSeats=Integer.parseInt(request.getParameter("noSeats"));
		int seats[]=StrUtil.breakStr(seat,noSeats);
		for(int i=0;i<noSeats;i++)
		{
			String name=request.getParameter("name"+i);
			int age=Integer.parseInt(request.getParameter("age"+i));
		    Ticket t=new Ticket(b, u, name, age, seats[i]);
		    TicketCRUD.add(t);
		}
		response.sendRedirect("ViewSch.jsp");
	}

}

package adminController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.BusCRUD;
import modal.Bus;

@WebServlet("/GetEditParam")
public class GetEditParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String aname=(String)session.getAttribute("adminName");
		if(aname!=null)
		{
		String id=request.getParameter("busId");
		Bus b=BusCRUD.get(id);
		if(b==null)
		{
			request.getRequestDispatcher("getBusEditId.jsp").include(request,response);
            response.setContentType("text/html");
            response.getWriter().println("BusId not found");
		}
		else
		{
			request.setAttribute("bus", b);
			request.getRequestDispatcher("editBus.jsp").forward(request,response);
		}
	  }
	}

}

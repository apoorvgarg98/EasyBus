package subAdminController;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modal.Ticket;
import subAdminBS.GenerateList;

@WebServlet("/GetList")
public class GetList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		List<Ticket> list=GenerateList.get(id);
		if(list.isEmpty())
		{
			request.getRequestDispatcher("subAdminAccount.jsp").include(request,response);
			response.setContentType("text/html");
			response.getWriter().println("Unable to generate list");
		}
		else{
			request.setAttribute("list",list);
			request.getRequestDispatcher("showList.jsp").forward(request,response);
		}
	}

}

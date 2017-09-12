package userController;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adminBusinessService.BusCRUD;
import modal.Bus;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String from=request.getParameter("from");
				String to=request.getParameter("to");
				String date=request.getParameter("date");
				DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
				Date d=null;
				try {
					d = formatter.parse(date);
				} catch (ParseException e){
					e.printStackTrace();
				}
				
				List<Bus> list=BusCRUD.search(from,to,d);
		        request.setAttribute("list",list);
		        request.getRequestDispatcher("ViewBuses.jsp").forward(request,response);
			
	}

}

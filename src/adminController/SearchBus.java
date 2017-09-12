package adminController;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import adminBusinessService.BusCRUD;
import modal.Bus;

@WebServlet("/SearchBus")
public class SearchBus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		String aname=(String)session.getAttribute("adminName");
		if(aname!=null)
		{
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
        request.getRequestDispatcher("viewBus.jsp").forward(request,response);
	
		}
	}

}

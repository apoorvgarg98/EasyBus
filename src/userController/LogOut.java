package userController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogOut")
public class LogOut extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session=request.getSession(false);
		if(session!=null)
		 session.invalidate();
		String url=request.getHeader("referer");
		if(url.contains("http://localhost:8080/EasyBus/Search"))
		  response.sendRedirect(url);
	    else
			response.sendRedirect("index.jsp");
	}

}

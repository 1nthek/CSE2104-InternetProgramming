

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WriteServlet
 */
@WebServlet("/write")
public class WriteServlet extends HttpServlet {
	HelpDao hDao = new HelpDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		if(type == null) {
			request.getRequestDispatcher("write.jsp").forward(request, response);			
		}
		else if(type.equals("delete")) {
			Integer no = Integer.parseInt(request.getParameter("no"));
			hDao.remove(no);
			response.sendRedirect("help");
		}
		else if(type.equals("edit")) {
			Integer no = Integer.parseInt(request.getParameter("no"));
			Help page = new Help();
			Help page2 = hDao.getOne(page, no);
			request.setAttribute("title", page2.getTitle());
			request.setAttribute("content", page2.getContent());
			request.getRequestDispatcher("write.jsp").forward(request, response);
		}
	}

}



import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Helplist
 */
@WebServlet("/helplist")
public class HelplistServlet extends HttpServlet {
	HelpDao hDao = new HelpDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelplistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer no = Integer.parseInt(request.getParameter("no"));
		Help page = new Help();
		Help page2 = hDao.getOne(page, no);
		request.setAttribute("title", page2.getTitle());
		request.setAttribute("writer", page2.getWriter());
		request.setAttribute("content", page2.getContent());
		request.setAttribute("no", no);
		request.getRequestDispatcher("helplist.jsp").forward(request, response);
		
	}

}

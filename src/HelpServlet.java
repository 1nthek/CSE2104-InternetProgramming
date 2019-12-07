

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class HelpServlet
 */
@WebServlet("/help")
public class HelpServlet extends HttpServlet {
	HelpDao hDao = new HelpDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HelpServlet() {
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
		String no = request.getParameter("no");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = (String) request.getSession().getAttribute("user_id");
		
		if (type!= null && type.equals("upload")) {
			hDao.add(title, content, writer);
		} else if (type!= null && type.equals("edit")) {			
			hDao.update(title, content, writer, no);
		}

		PageUtil<Help> page = new PageUtil<Help>();
		hDao.get(page);
		request.setAttribute("page", page);
		request.getRequestDispatcher("help.jsp").forward(request, response);
	}

}

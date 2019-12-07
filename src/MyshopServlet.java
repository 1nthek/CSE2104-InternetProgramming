

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyshopServlet
 */
@WebServlet("/myshop")
public class MyshopServlet extends HttpServlet {

	MyshopDao myDao = new MyshopDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyshopServlet() {
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
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		String id = (String) request.getSession().getAttribute("user_id");
		PageUtil<Myshop> page = new PageUtil<Myshop>();
		String type = request.getParameter("type");
		if(type!=null && type.equals("all") && request.getSession().getAttribute("is_admin").equals("true")) {
			myDao.getAll(page);
		}
		else {
			myDao.get(page, id);
		}

		request.setAttribute("page", page);
		request.getRequestDispatcher("myshop.jsp").forward(request, response);
	}

}

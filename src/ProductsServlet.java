

import java.io.Console;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProductsServlet
 */
@WebServlet("/products")
public class ProductsServlet extends HttpServlet {
	ProductsDao pDao = new ProductsDaoImpl();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductsServlet() {
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
		//doGet(request, response);
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		if (type==null || type.equals("all")) {
			doAll(request, response);
		} else if (type.equals("top") || type.equals("bottom")) {
			fetch(request, response, type);
		} 
	}
	public void fetch(HttpServletRequest request, HttpServletResponse response, String type)
		throws ServletException, IOException {
			PageUtil<Products> page = new PageUtil<Products>();
			pDao.selectByCategory(page, type);
			request.setAttribute("page", page);
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	public void doAll(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			PageUtil<Products> page = new PageUtil<Products>();
			pDao.selectAll(page);
			request.setAttribute("page", page);
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}

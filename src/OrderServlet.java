

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order")
public class OrderServlet extends HttpServlet {
	CartDao cDao = new CartDaoImpl();
	DetailDao dDao = new DetailDaoImpl();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
		String id = (String) request.getSession().getAttribute("user_id");
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용하시기 바랍니다.'); location.href='login';</script>");
			out.flush();
		}
		else {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			String no = request.getParameter("product_no");
			if(no == null) {
				PageUtil<Cart> page = new PageUtil<Cart>();
				String totalPrice = cDao.fetch(page, id);
				request.setAttribute("page", page);
				request.setAttribute("totalPrice", totalPrice);
			} else {
				PageUtil<Detail> page = new PageUtil<Detail>();
				dDao.fetchData(page, no);
				request.setAttribute("page", page);
				request.setAttribute("totalPrice", page.list.get(0).getPrice().toString());
				request.setAttribute("product_no", no);
			}
			request.getRequestDispatcher("order.jsp").forward(request, response);
		}
	}

}

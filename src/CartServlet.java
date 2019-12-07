

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	CartDao cDao = new CartDaoImpl();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
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
		String id = (String) request.getSession().getAttribute("user_id");
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 후 이용하시기 바랍니다.'); location.href='login';</script>");
			out.flush();
		}
		else {
			String no = request.getParameter("product_no");
			String delNo = request.getParameter("del");
			if(no!= null) {
				cDao.add(id, no);
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('장바구니에 추가하였습니다.'); location.href='detail?product_no=" + no + "';</script>");
				out.flush();				
			}
			else {
				if(delNo != null) {
					cDao.remove(id, delNo);
				}
				PageUtil<Cart> page = new PageUtil<Cart>();
				String totalPrice =  cDao.fetch(page, id);
				request.setAttribute("page", page);
				request.setAttribute("totalPrice", totalPrice);
				request.getRequestDispatcher("cart.jsp").forward(request, response);	
			}
		}
	}

}

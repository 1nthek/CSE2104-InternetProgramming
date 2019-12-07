
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@SuppressWarnings("serial")
@WebServlet("/detail")
public class DetailServlet extends HttpServlet {
	DetailDao dDao = new DetailDaoImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			response.setContentType("text/html");
			response.setCharacterEncoding("UTF-8");
			request.setCharacterEncoding("UTF-8");
			String no = request.getParameter("product_no");
			String type = request.getParameter("type");

			if(type!=null && type.equals("delete") && request.getSession().getAttribute("is_admin").equals("true")) {
				dDao.remove(Integer.parseInt(no));
				response.sendRedirect("products");
			}
			else if(type!=null && type.equals("upload") && request.getSession().getAttribute("is_admin").equals("true")) {
				String name = request.getParameter("name");
				String price = request.getParameter("price");
				String material = request.getParameter("material");
				String imgUrl = request.getParameter("imgUrl");
				String size = request.getParameter("size");
				String category = request.getParameter("category");
				String content = request.getParameter("content");
				dDao.add(name, price, material, imgUrl, size, category, content);
				response.sendRedirect("products");
			}
			else {
				PageUtil<Detail> page = new PageUtil<Detail>();
				dDao.fetchData(page, no);
				request.setAttribute("page", page);
				request.getRequestDispatcher("detail.jsp").forward(request, response);				
			}
	}

}
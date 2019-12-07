

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	LoginDao lDao = new LoginDaoImpl();
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		String type = request.getParameter("type");
		if (type!= null && type.equals("auth")) {
			doAuth(request, response);
		}
		else {
			request.getRequestDispatcher("login.jsp").forward(request, response);			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doAuth(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(lDao.isVaild(id, pw)) {
			if(lDao.isAdmin(id)) {
				request.getSession().setAttribute("is_admin", "true");
			}else {
				request.getSession().setAttribute("is_admin", "false");				
			}
			request.getSession().setAttribute("user_id", id);
			request.getRequestDispatcher("products?type=all").forward(request, response);
		}
		else {
			request.getSession().invalidate();
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다'); location.href='login';</script>");
			out.flush();
		}
	}
}

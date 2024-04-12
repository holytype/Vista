package shop.mall.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.mall.model.dto.MemberInfo;
import shop.mall.model.dto.MemberLoginDto;
import shop.mall.model.service.MemberService;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberInfo loginLog = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		loginLog = service.memberLogin(new MemberLoginDto(id,pw));

		if(loginLog!=null) {
			request.getSession().setAttribute("loginLog", loginLog);
		}

		response.getWriter().append(String.valueOf(loginLog));
	}

}

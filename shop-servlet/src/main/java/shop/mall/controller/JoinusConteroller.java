package shop.mall.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.mall.model.dto.MemberDto;
import shop.mall.model.service.MemberService;

/**
 * Servlet implementation class RegisterConteroller
 */
@WebServlet("/joinus")
public class JoinusConteroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinusConteroller() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/joinus.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer result = null;
		result = service.registMember(new MemberDto(request.getParameter("id"),
				request.getParameter("pw"),"default",request.getParameter("name"),
				request.getParameter("address"),request.getParameter("phone"),
				request.getParameter("email"),request.getParameter("gender"),
				request.getParameter("account")));
		
		response.getWriter().append(String.valueOf(result));
	}

}

package shop.mall.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.mall.model.service.MemberService;

/**
 * Servlet implementation class IdCheckController
 */
@WebServlet("/idcheck")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdCheckController() {
        super();
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer result = service.idDuplicateCheck(request.getParameter("id"));
		response.getWriter().append(String.valueOf(result));
	}

}

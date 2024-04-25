package shop.mall.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.mall.model.dto.MemberAddressDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.service.AddrService;

/**
 * Servlet implementation class OrderController
 */
@WebServlet("/mypage/address")
public class MyAddressController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddrService service = new AddrService(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyAddressController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto info = null;
		info = (MemberInfoDto) request.getSession().getAttribute("loginLog");
		List<MemberAddressDto> result = service.getAddr(info.getMemId());
		request.setAttribute("addrList", result);
		request.getRequestDispatcher("/WEB-INF/views/mypage/myaddress.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInfoDto info = null;
		info = (MemberInfoDto) request.getSession().getAttribute("loginLog");
		Integer result = service.updateAddrPin(new MemberAddressDto(Integer.parseInt(request.getParameter("daid")),info.getMemId()));
		response.getWriter().append(String.valueOf(result));
	}

}

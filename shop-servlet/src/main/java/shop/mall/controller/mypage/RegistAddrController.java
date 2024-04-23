package shop.mall.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.mall.model.dto.MemberAddressDto;

/**
 * Servlet implementation class RegistAddr
 */
@WebServlet("/mypage/address.regist")
public class RegistAddrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistAddrController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<MemberAddressDto> data=null;
		
		
		if(request.getAttribute("addrList")!=null&&request.getAttribute("addrList") instanceof List<?>) {
			data = (List<MemberAddressDto>) request.getAttribute("addrList");
		}
			
		System.out.println(data.get(0));
		request.getRequestDispatcher("/WEB-INF/views/mypage/registaddr.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package shop.mall.controller.mypage;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import shop.mall.model.dto.MemberAddressDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.service.AddrService;

/**
 * Servlet implementation class RegistAddr
 */
@WebServlet("/mypage/address.regist")
public class RegistAddrController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private AddrService service = new AddrService(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistAddrController() {
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
		request.getRequestDispatcher("/WEB-INF/views/mypage/registaddr.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String[] addrnameArr = request.getParameterValues("sfds");
//		String[] addrpostArr = request.getParameterValues("addrpost");
//		String[] addrsdfdsfarr = request.getParameterValues("addrsdfdsf");
		
        // 방법 1 항상 OK
//        Sample[] reqVoArray = gson.fromJson(param, Sample[].class);
//        List<Sample> reqVoList = Arrays.asList(reqVoArray);
//        System.out.println(reqVoList);
//                        [Sample [name=이 이, age=30], Sample [name=신사임당, age=47], Sample [name=황진이, age=25]]
        // 방법 2 안될수도 있네요~
//        List<Sample> reqVoList2 = gson.fromJson(param, new TypeToken<List<Sample>>(){}.getType());
		Integer result = null;
		// gson 라이브러리를 활용해서 넘어온 json data를 파싱한다.
		Gson gson = new Gson();
		MemberAddressDto[] addrVoList = gson.fromJson(request.getReader(), MemberAddressDto[].class);
		List<MemberAddressDto> addrList = Arrays.asList(addrVoList);
		System.out.println(addrList);
		MemberInfoDto dto = (MemberInfoDto) request.getSession().getAttribute("loginLog");
		if(dto==null) {
			response.getWriter().append(String.valueOf(result));
			return;
		}
		
		result =service.insertAddr(addrList,dto.getMemId());
		response.getWriter().append(String.valueOf(result));
		
	}

}

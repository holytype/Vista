package shop.mall.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.dto.MemberLoginDto;
import shop.mall.model.service.MemberService;

import static shop.mall.model.common.IpChecker.*;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
       
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
		
		//service.writeLog(getClientIP(request));
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		TimeZone tz = TimeZone.getTimeZone("Asia/Seoul");
//		sdf.setTimeZone(tz);
//		String logTime = sdf.format(new Date());
		
		/*
		 * Cookie[] cookies = request.getCookies();
		 * System.out.println(cookies[1].getName()+" : "+cookies[1].getValue());
		 * if(cookies[0].getName().equals("logTime")&&cookies[0].getValue()!=null) {
		 * Date newDate=null; Date oldDate = null; try { oldDate =
		 * sdf.parse(cookies[0].getValue()); newDate = sdf.parse(logTime);
		 * 
		 * 
		 * } catch (ParseException e) { e.printStackTrace(); }
		 * 
		 * long nTime = newDate.getTime(); long oTime = oldDate.getTime(); long diff =
		 * nTime-oTime;
		 * 
		 * if((diff/1000)<300) {
		 * 
		 * } }
		 */
		
//		System.out.println(getClientIP(request));
		
		MemberInfoDto loginLog = null;
		loginLog = service.memberLogin(new MemberLoginDto(request.getParameter("id"),request.getParameter("pw")),getClientIP(request));
		
//		if(loginLog!=null) {
//			Cookie cookie = new Cookie("logTime",logTime);
//			cookie.setMaxAge(300);
//			response.addCookie(cookie);
//			request.getSession().setAttribute("loginLog", loginLog);
//		}
		
		if(loginLog!=null)
			request.getSession().setAttribute("loginLog", loginLog);

		response.getWriter().append(String.valueOf(loginLog));
	}
	
	

}

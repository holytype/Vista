package shop.mall.common.filter;

import static shop.mall.model.common.IpChecker.getClientIP;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.mall.model.service.MainService;

@WebFilter(filterName = "logFilter", urlPatterns = {"/*"} )
public class LogFilter implements Filter {
	private MainService service = new MainService();
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("firstVisit") == null) {
			session.setAttribute("firstVisit",true);
			service.writeLog(getClientIP(request));
		}
		
		session.setAttribute("menuCategory", service.getCategory());
		
		chain.doFilter(request, response);
	}
}

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

import shop.mall.model.service.MainService;

@WebFilter(filterName = "loginFilter", urlPatterns = {"/*"} )
public class LogFilter implements Filter {
	MainService service = new MainService();
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		System.out.println("logfilter");
		HttpServletRequest request = (HttpServletRequest) req;
		System.out.println(request.getSession().getAttribute("firstVisit"));
		if(request.getSession().getAttribute("firstVisit") == null) {
			request.getSession().setAttribute("firstVisit",true);
			service.writeLog(getClientIP(request));
			System.out.println("log insert : "+getClientIP(request));
		}
		chain.doFilter(request, response);
	}

}

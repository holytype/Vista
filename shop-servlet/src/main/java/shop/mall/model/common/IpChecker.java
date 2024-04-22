package shop.mall.model.common;

import java.net.InetAddress;
import java.net.UnknownHostException;

import javax.servlet.http.HttpServletRequest;

public class IpChecker {
	
	public static String getClientIP(HttpServletRequest request) {
	    String ip = request.getHeader("X-Forwarded-For");

	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	    }
	    if (ip == null) {
	        ip = request.getHeader("X-RealIP");
	    }
	    if (ip == null) {
	    	ip = request.getRemoteAddr();
	    }
	    
	    if (ip.equals("0:0:0:0:0:0:0:1")||ip.equals("127.0.0.1")) {
	    	try {
				InetAddress address = InetAddress.getLocalHost();
				ip = address.getHostName()+"/"+address.getHostAddress();
			} catch (UnknownHostException e) {
				e.printStackTrace();
			}
	    }

	    return ip;
	}
}

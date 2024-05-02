package shop.mall.controller.manager;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.manager.ManagerServlet;

import com.google.gson.Gson;

import shop.mall.model.dto.MemberAddressDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.service.ManageService;

/**
 * Servlet implementation class CategoryController
 */
@WebServlet("/manager/category.edit")
public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ManageService service = new ManageService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer result = null;
		Gson gson = new Gson();
		String[] tagList = gson.fromJson(request.getReader(), String[].class);
		List<String> cList = Arrays.asList(tagList);
		System.out.println(cList);
		
		result = service.setCategory(cList);
		System.out.println("/manager/category.edit : "+result);
		response.getWriter().append(String.valueOf(result));
	}

}

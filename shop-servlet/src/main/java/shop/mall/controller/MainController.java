package shop.mall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import shop.mall.model.dto.MainGridDto;
import shop.mall.model.service.MainService;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MainService service = new MainService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("menuCategory", service.getCategory());
		request.getRequestDispatcher("WEB-INF/views/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainGridDto dto= new MainGridDto("1", "1", "1", "1", "1");
		List<MainGridDto> result = new ArrayList<MainGridDto>();
		result.add(dto);
		result.add(dto);
		result.add(dto);
		result.add(dto);
		Gson data = new Gson();
		response.getWriter().append(data.toJson(result));
	}

}

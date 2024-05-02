package shop.mall.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import shop.mall.model.dto.ItemBoardDto;
import shop.mall.model.dto.ItemBoardFileDto;
import shop.mall.model.service.BoardService;
import shop.mall.model.service.MainService;
import shop.mall.model.service.ManageService;


/**
 * Servlet implementation class MainController
 */
@WebServlet({"/main",""})
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	private ManageService manageService = new ManageService();
       
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
		List<ItemBoardFileDto> banners = manageService.getBannerImage();
		List<ItemBoardFileDto> unders = manageService.getUnderBannerImage();
		request.setAttribute("banners", banners);
		request.setAttribute("unders", unders);
		request.getRequestDispatcher("WEB-INF/views/main.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ItemBoardDto> result = service.getMainItemBoard();
		Gson data = new Gson();
		response.getWriter().append(data.toJson(result));
	}
	
}

package shop.mall.controller.manager;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import shop.mall.model.dto.ItemBoardFileDto;
import shop.mall.model.service.BoardService;
import shop.mall.model.service.ManageService;

/**
 * Servlet implementation class PostItem
 */
@WebServlet("/manager/posting")
public class ProductPostingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductPostingController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/manager/posting.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = request.getServletContext().getRealPath("files");
		System.out.println("uploadPath:"+uploadPath);
		
		File uploadPathFile = new File(uploadPath);
		if(!uploadPathFile.exists()) {
			uploadPathFile.mkdirs();
		}
		int uploadFileLimit = 10 * 1024 *1024;
		
		MultipartRequest multiReq = new MultipartRequest(request,  // jsp->controll로 전달된 객체 
				uploadPath,  //  서버에 저장할 디렉토리 
				uploadFileLimit, // 업로드 파일 크기제한
				"UTF-8", // 인코딩 방법
				new DefaultFileRenamePolicy() // was 서버에 저장할 디렉토리에 동일이름이 존재할때 새로운 이름 부여방식 
				);
		
		String title = multiReq.getParameter("title");
		System.out.println("title");
		System.out.println(title);
        String content = multiReq.getParameter("content");
        System.out.println("content");
        System.out.println(content);
        String category = multiReq.getParameter("category");
        System.out.println("category");
        System.out.println(category);
		
		List<ItemBoardFileDto> fileList = new ArrayList<ItemBoardFileDto>();
		
		Enumeration<?> fileNames = multiReq.getFileNames();
		while(fileNames.hasMoreElements()) {
			String name = (String)fileNames.nextElement();   // input type="file" name="xxx", xxx_0, xxx_1
			String fileName = multiReq.getFilesystemName(name);  // 서버에 저장된 파일이름
			String orginFileName = multiReq.getOriginalFileName(name);
			String type = multiReq.getContentType(name);  // 전송된 파일의 타입
			System.out.println(type);
			File f1= multiReq.getFile(name);  // name을 이용해서 파일 객체 생성 여부 확인 작업.
			if (f1==null) {  // name을 이용해서 파일 객체 생성에 실패하면
				System.out.println("파일 업로드 실패");   // 실패 오류메시지  
			} else {
//				System.out.println(f1.length());   // 그 파일의 크기 
			}
			System.out.println(name + "  :  "+ fileName+"  :  "+orginFileName);
			fileList.add(new ItemBoardFileDto(0,uploadPath, fileName, orginFileName));
		}
		
		
	}

}

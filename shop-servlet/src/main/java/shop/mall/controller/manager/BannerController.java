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
import shop.mall.model.service.ManageService;

/**
 * Servlet implementation class BannerController
 */
@WebServlet("/manager/banner")
public class BannerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ManageService service = new ManageService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BannerController() {
        super();
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
		
		List<ItemBoardFileDto> imageList = new ArrayList<ItemBoardFileDto>();
		
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
			imageList.add(new ItemBoardFileDto(0,uploadPath, fileName, orginFileName));
		}
		System.out.println(imageList.get(0).getItemBoardId());
		Integer result = service.setBannerImage(imageList);
		response.getWriter().append(String.valueOf(result));
	}

}

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

/**
 * Servlet implementation class ImagePostingController
 */
@WebServlet("/ImagePostingController")
public class PostingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = req.getServletContext().getRealPath("files");
		//uploadPath:C:\workspace\Java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\31_web_project\
		//uploadPath:C:\workspace\Java\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\31_web_project\files
				System.out.println("uploadPath:"+uploadPath);
				File uploadPathFile = new File(uploadPath);
				if(!uploadPathFile.exists()) {
					uploadPathFile.mkdirs();
				}
				int uploadFileLimit = 10 * 1024 *1024; // 10M제한
				// form enctype="multipart/form-data" 형태로 전달된 경우
				MultipartRequest multiReq = new MultipartRequest(req,  // jsp->controll로 전달된 객체 
						uploadPath,  //  서버에 저장할 디렉토리 
						uploadFileLimit, // 업로드 파일 크기제한
						"UTF-8", // 인코딩 방법
						new DefaultFileRenamePolicy() // was 서버에 저장할 디렉토리에 동일이름이 존재할때 새로운 이름 부여방식 
						);
				/// 중요!!! 이시점에 new MultipartRequest() 하면 file은 uploadPath위치에 저장완료!

				List<ItemBoardFileDto> fileList = new ArrayList<ItemBoardFileDto>();
				// JSP-> Controller File 딱 1개일 경우
//				String filePath = multiReq.getFilesystemName("uploadfiles"); 
//				if(filePath == null) {
//					System.out.println("첨부파일이 없었습니다.");
//				}else {
//					System.out.println("첨부파일정보는===");
//					System.out.println(filePath);
//					System.out.println(multiReq.getOriginalFileName("uploadfiles"));
//				}
				// JSP-> Controller File 0개이상일 경우
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
//						System.out.println(f1.length());   // 그 파일의 크기 
					}
//					System.out.println(name + "  :  "+ fileName+"  :  "+orginFileName);
//					uploadfiles: SQL실습과제5.jpg : SQL실습과제.jpg
//					uploadfiles_0: t7.PNG : t.PNG
//					uploadfiles_1: 캡처6.PNG : 캡처.PNG
//					ItemBoardFileDto filedto = new ItemBoardFileDto(fileName, orginFileName);
//					fileList.add(filedto);			
				}
				
				String subject = multiReq.getParameter("subject");
				String content = multiReq.getParameter("content");
				//MemberInfoDto memberInfoDto = (MemberInfoDto)req.getSession().getAttribute("sssLogin"); 
//				System.out.println(subject);
//				System.out.println(content);
//				BoardInsertDto dto = new BoardInsertDto(subject, content, memberInfoDto.getMemId());
				BoardInsertDto dto = new BoardInsertDto(subject, content, "kh1", fileList);  //TODO
				System.out.println(dto);
				int result = service.insert(dto);
				resp.sendRedirect(req.getContextPath()+"/board/list");
	}

}

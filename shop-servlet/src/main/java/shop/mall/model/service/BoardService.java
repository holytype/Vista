package shop.mall.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dao.BoardDao;
import shop.mall.model.dto.ItemBoardDto;
import shop.mall.model.dto.ItemBoardFileDto;

import static shop.mall.common.mybatis.MybatisTemplate.*;

public class BoardService {
	private BoardDao dao = new BoardDao();
	
	public List<ItemBoardDto> getMainItemBoard() {
		List<ItemBoardDto> result = null;
		SqlSession session = getSqlSession(true);
		result=dao.getMainItemBoard(session);
		result=dao.getItemColors(session, result);
		result=dao.getItemFiles(session, result);
		session.close();
		return 	result;
	}
	
	public ItemBoardDto getItem(String itemBoardId) {
		ItemBoardDto result = null;
		SqlSession session = getSqlSession(true);
		result=dao.getItem(session,itemBoardId);
		session.close();
		return 	result;
	}
	
//	public List<ItemBoardFileDto> uploadFile(HttpServletRequest request){
//		new DiskFileItemFactory();
//		ServletFileUpload servletFileUpload = new ServletFileUpload();
//		List<FileItem> items = servletFileUpload.parseRequest(request);
//		List<ItemBoardFileDto> fileList = new ArrayList<>();
//		for (FileItem item : items) {
//		    if (item.isFormField()) {
//		    	
//		    	ItemBoardFileDto imageFileDTO = null;
//
//		    	// 폼 필드 데이터 처리
//                String fieldName = item.getFieldName();
//                String fieldValue = item.getString();
//                
//             // 필드 이름과 값 출력
//                System.out.println("/BoardService/uploadFile");
//                System.out.println(fieldName + ": " + fieldValue);
//                
//	            // 공백문자를 언더스코어로 교체하기
//                fieldName = fieldName.replace(' ', '_');
//
//
//	            // 위에서 생성했던 리스트에 첨부 이미지 데이터 담기
//	            fileList.add(imageFileDTO);
//
//	            try {
//	                // 파일 경로에 저장하기
//	                mtf.transferTo(new File(saveFile));
//
//	            } catch (IOException e) {
//	                e.printStackTrace();
//	            }
//		    } else {
//		        // 파일 데이터 처리
//		    }
//		
//		 // multipartFile 리스트
//        List<MultipartFile> mtfs = mtfRequest.getFiles("image");
//
//        //
//        List<ImageFileDTO> fileList = new ArrayList<>();
//
//        for (MultipartFile mtf : mtfs) {
//
//
//        }
//
//        return fileList;  // 파일 리스트 반환
//		}
//	}
	
}

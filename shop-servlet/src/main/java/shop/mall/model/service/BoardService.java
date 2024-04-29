package shop.mall.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dao.BoardDao;
import shop.mall.model.dto.ItemBoardDto;

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
}

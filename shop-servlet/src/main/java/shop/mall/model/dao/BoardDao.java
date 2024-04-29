package shop.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.ItemBoardDto;
import shop.mall.model.dto.ItemBoardFileDto;

public class BoardDao {
	public List<ItemBoardDto> getMainItemBoard(SqlSession session) {
		return session.selectList("board.getMainItemBoard");
	}
	
	public List<ItemBoardDto> getItemColors(SqlSession session, List<ItemBoardDto>  dto) {
		for(ItemBoardDto item : dto) {
			
			List<String> list = session.selectList("board.getItemColors",item.getItemBoardId());
			item.setColorList(list);
		}
		return dto;
	}
	
	public List<ItemBoardDto> getItemSizes(SqlSession session, List<ItemBoardDto>  dto) {
		for(ItemBoardDto item : dto) {
			
			List<String> list = session.selectList("board.getItemSizes",item.getItemBoardId());
			item.setColorList(list);
		}
		return dto;
	}
	
	public List<ItemBoardDto> getItemFiles(SqlSession session, List<ItemBoardDto>  dto) {
		for(ItemBoardDto item : dto) {
			List<ItemBoardFileDto> list = session.selectList("board.getItemFiles",item.getItemBoardId());
			item.setFileList(list);
		}
		return dto;
	}
	
	public ItemBoardDto getItem(SqlSession session, String itemBoardId) {
		return session.selectOne("board.getItem");
	}
}

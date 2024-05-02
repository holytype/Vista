package shop.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.ItemBoardFileDto;

public class ManageDao {
	public Integer setBannerImage(SqlSession session, List<ItemBoardFileDto> dto){
		return session.insert("manage.setBannerImage",dto);
	}
	
	public List<ItemBoardFileDto> getBannerImage(SqlSession session){
		return session.selectList("manage.getBannerImage");
	}
	
	public Integer deleteBannerImage(SqlSession session){
		return session.delete("manage.deleteBannerImage");
	}
	
	public Integer setUnderBannerImage(SqlSession session, List<ItemBoardFileDto> dto){
		return session.insert("manage.setUnderBannerImage",dto);
	}
	
	public List<ItemBoardFileDto> getUnderBannerImage(SqlSession session){
		return session.selectList("manage.getUnderBannerImage");
	}
	
	public Integer deleteUnderBannerImage(SqlSession session){
		return session.delete("manage.deleteBannerImage");
	}
	
	public void deleteCategory(SqlSession session){
		session.delete("manage.deleteCategory");
		return;
	}
	
	public Integer setCategory(SqlSession session, List<String> dto){
		return session.insert("manage.setCategory",dto);
	}
}

package shop.mall.model.service;

import java.util.List;


import shop.mall.model.dao.AddrDao;
import shop.mall.model.dto.MemberAddressDto;

import static shop.mall.common.mybatis.MybatisTemplate.*;

public class AddrService {
	AddrDao dao = new AddrDao();
	
	// memId로 배송지 불러오기
	public List<MemberAddressDto> getAddr(String id) {
		List<MemberAddressDto> result = null;
		result = dao.getAddr(getSqlSession(true), id);
		return result;
	}
	// dto로 배송지 입력하기
	public Integer insertAddr(List<MemberAddressDto> dto) {
		Integer result = null;
		result = dao.insertAddr(getSqlSession(true), dto);
		return result;
	}
	// daId로 배송지 삭제하기
	public Integer deleteAddr(List<String> dto) {
		Integer result = null;
		result = dao.deleteAddr(getSqlSession(true), dto);
		return result;
	}
	
	// 고정 배송지 수정하기
	public Integer updateAddrPin(String deleteId, String updateId) {
		Integer result = null;
		result = dao.deleteAddrPin(getSqlSession(true), deleteId);
		
		if(result==1)
			result = dao.updateAddrPin(getSqlSession(true), updateId);
		return result;
	}
}

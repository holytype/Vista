package shop.mall.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.MemberAddressDto;

public class AddrDao {
	public List<MemberAddressDto> getAddr(SqlSession session, String id) {
		return session.selectList("addr.getAddr",id);
	}
	public Integer insertAddr(SqlSession session, List<MemberAddressDto> dto) {
		return session.insert("addr.insertAddr", dto);
	}
	public Integer deleteAddr(SqlSession session, String id) {
		return session.delete("addr.deleteAddr", id);
	}
	public Integer updateAddrPin(SqlSession session, MemberAddressDto dto) {
		return session.update("addr.updateAddrPin", dto);
	}
	
	public Integer deleteAddrPin(SqlSession session, String id) {
		return session.update("addr.deleteAddrPin", id);
	}
}

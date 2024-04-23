package shop.mall.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.MemberDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.dto.MemberLoginDto;

import static shop.mall.common.jdbc.JdbcTemplate.*;

public class MemberDao {
	
	// 로그인
	public Map<String,String> memberLogin(SqlSession session, MemberLoginDto dto) {
		Map<String,String> result = null;
		String name = session.selectOne("member.memberLoginName",dto);
		String auth = session.selectOne("member.memberLoginAuth",dto);
		if(name==null||auth==null) {
			return result;
		}
		result=new HashMap<String, String>();
		result.put("name", name);
		result.put("auth", auth);

		return result;
	}
	
	// 회원 로그인 로그 삽입/시간반환
	public String memberLoginLog(SqlSession session, MemberInfoDto dto) {
		String time = null;
		Map<String,String> map= new HashMap<String, String>();
		session.insert("manage.loginLog", dto);
		time = session.selectOne("manage.loginLogTime",dto.getIp());
		dto=null;
		return time;
	}
	
	
	//아이디중복확인
	public Integer idDuplicateCheck(Connection conn, String mId) {
		Integer result = null;
		String sql = "select count(*) c from member where MEM_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("c");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		close(rs);
		close(pstmt);
		return result;
	}
	
	public Integer idDuplicateCheckMybatis(SqlSession session, String mId) {
		return session.selectOne("member.idDuplicateCheck",mId);
	}
	
	//회원가입
	public Integer registMember(SqlSession session, MemberDto dto) {
		return session.insert("member.registMember", dto);
	}
}

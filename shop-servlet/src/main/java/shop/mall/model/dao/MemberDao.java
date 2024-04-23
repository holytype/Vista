package shop.mall.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import shop.mall.model.dto.MemberDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.dto.MemberLoginDto;

import static shop.mall.common.jdbc.JdbcTemplate.*;

public class MemberDao {
	
	// 로그인
	public List<MemberInfoDto> memberLogin(SqlSession session, MemberLoginDto dto) {
		List<Map<String,String>> data = session.selectList("member.memberLogin", dto);
		System.out.println("MemberDao > memberLogin :"+data);
		List<MemberInfoDto> result = null;
		return result;
	}
	
	
	// 로그인
		public Integer WriteLog(Connection conn , Map<String, Object> data, String ip) {
			Integer result = null;
			String sql = "INSERT INTO LOG VALUES(SEQ_LOG_ID.LEXTVAL,?,?,DEFAULT)";
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String)data.get("memberID"));
				pstmt.setString(2, ip);
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

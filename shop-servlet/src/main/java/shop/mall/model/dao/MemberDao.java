package shop.mall.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import shop.mall.model.dto.MemberDto;
import shop.mall.model.dto.MemberInfoDto;
import shop.mall.model.dto.MemberLoginDto;

import static shop.mall.common.jdbc.JdbcTemplate.*;

public class MemberDao {
	
	// 로그인
	public MemberInfoDto memberLogin(Connection conn , MemberLoginDto dto) {
		MemberInfoDto result = null;
		String sql = "select M_ID,M_NAME,M_AUTH from member where m_id=? and m_pw=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getmId());
			pstmt.setString(2, dto.getmPw());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = new MemberInfoDto(rs.getString("M_ID"), rs.getString("M_NAME"), rs.getString("M_AUTH"));
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
		String sql = "select count(*) c from member where m_id=?";
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
	
	//회원가입
	public Integer registMember(Connection conn, MemberDto dto) {
		Integer result = null;
		String sql = "insert into member values(?,?,default,?,?,?,?,?,?)";
		PreparedStatement pstmt=null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getmId());
				pstmt.setString(2, dto.getmPw());
//				pstmt.setString(3, dto.getmAuth());
				pstmt.setString(3, dto.getmName());
				pstmt.setString(4, dto.getmAddr());
				pstmt.setString(5, dto.getmPhone());
				pstmt.setString(6, dto.getmEmail());
				pstmt.setString(7, dto.getmSex());
				pstmt.setString(8, dto.getmAcct());
				
				result=pstmt.executeUpdate();
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		close(pstmt);
		return result;
	}
}

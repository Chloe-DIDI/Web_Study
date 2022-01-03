package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성
	private Connection conn;
	
	// 생성자로 db 연결
	public ScoreDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 전체 조회 메소드
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		// 쿼리문 준비
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR + ENG + MAT) AS TOT, (KOR + ENG + MAT)/3.0 AS AVG FROM TBL_SCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setKor(rs.getString(3));
			dto.setEng(rs.getString(4));
			dto.setMat(rs.getString(5));
			dto.setTot(rs.getString(6));
			dto.setAvg(String.format("%.1f",rs.getDouble(7)));
			
			result.add(dto);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// 데이터 추가 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		int result=0;
		
		// 쿼리문 준비
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, Integer.parseInt(dto.getKor()));
		pstmt.setInt(3, Integer.parseInt(dto.getEng()));
		pstmt.setInt(4, Integer.parseInt(dto.getMat()));
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 전체 인원 수 조회 메소드
	public int count() throws SQLException
	{
		int result=0;
		
		// 쿼리문 준비
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next())
			result = rs.getInt(1);
		
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	// db 연결 종료
	public void close() throws SQLException
	{
		DBConn.close();
	}
}

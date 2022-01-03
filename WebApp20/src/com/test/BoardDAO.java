/* ============================
       BoardDAO.java
============================ */

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class BoardDAO
{
   // 주요 속성 구성
   private Connection conn;
   
   // 생성자 정의
   public BoardDAO(Connection conn)
   {
      this.conn = conn;
   }
   
   // 게시물 번호의 최대값 얻어내기
   public int getMaxNum()
   {
      int result = 0;
      
      Statement stmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try 
      {
         sql = "SELECT NVL(MAX(NUM),0) AS MAXNUM FROM TBL_BOARD";
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         
         if(rs.next())
            result = rs.getInt(1);
         
         rs.close();
         stmt.close();
         
      }catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result; 
      
   }// end getMaxNum()
   
   // 게시물 작성 → 데이터 입력
   public int insertData(BoardDTO dto)
   {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = "";      
      try 
      {
          // hitCount 는 기본값 0 또는 default 또는 입력항목 생략
           // created 는 기본값 sysdate 또는 default 또는 입력항목 생략 가능
           sql = "INSERT INTO TBL_BOARD(NUM, NAME, PWD, EMAIL, SUBJECT" + 
               ", CONTENT, IPADDR, HITCOUNT, CREATED)" + 
               " VALUES (?, ?, ?, ?, ?, ?, ?, 0, SYSDATE)";
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, dto.getNum());
         pstmt.setString(2, dto.getName());
         pstmt.setString(3, dto.getPwd());
         pstmt.setString(4, dto.getEmail());
         pstmt.setString(5, dto.getSubject());
         pstmt.setString(6, dto.getContent());
         pstmt.setString(7, dto.getIpAddr());
      
         result = pstmt.executeUpdate();
         
         pstmt.close();
      }catch(Exception e)
      {
         System.out.println(e.toString());
      }
   
      return result;
   }// end insertData(BoardDTO dto)
   
   // DB 레코드의 갯수를 가져오는 메소드 정의
   // → 검색 기능을 작업하게 되면 수정하게 될 메소드
   // ▶일반적인 게시판일 경우 이렇게 정의되지만, 검색기능이 들어갈 경우
   // 검색결과에 해당하는 게시글은 줄어드니까 전체 페이징처리가 다르게 된다.   
   public int getDataCount()
   {
      int result = 0;
      
      Statement stmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try
      {
         sql = "SELECT COUNT(*) AS COUNT FROM TBL_BOARD";
         
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         
         if(rs.next())
            result = rs.getInt(1);
         
         rs.close();
         stmt.close();
         
      }catch(Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result;
   }
   
   // 특정 영역(시작번호 ~ 끝번호) 게시글의 목록을
   // 읽어오는 메소드 정의 
   // ▶ 페이징 처리에서 페이지에 해당하는 게시물 목록 구성
   // → 검색 기능을 작업하게 되면 수정하게 될 메소드
   public List<BoardDTO> getLists(int start, int end)
   {
      List<BoardDTO> result = new ArrayList<BoardDTO>();
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try
      {
         sql = "SELECT NUM, NAME, SUBJECT, HITCOUNT, CREATED"
               + " FROM ( SELECT ROWNUM RNUM, DATA.*"
               + " FROM ( SELECT NUM, NAME, SUBJECT, HITCOUNT, TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
               + " FROM TBL_BOARD ORDER BY NUM DESC ) DATA )"
               + " WHERE RNUM >= ? AND RNUM <= ?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, start);
         pstmt.setInt(2, end);
         
         rs = pstmt.executeQuery();
         while(rs.next())
         {
            BoardDTO dto = new BoardDTO();
            dto.setNum(rs.getInt(1));
            dto.setName(rs.getString(2));
            dto.setSubject(rs.getString(3));
            dto.setHitCount(rs.getInt(4));
            dto.setCreated(rs.getString(5));

            result.add(dto);
         }
         
         rs.close();
         pstmt.close();
         
      }catch(Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result;
   }// end getLists(int start, int end)
   
   // 특정 게시물 조회에 따른 조회 횟수 증가 메소드 정의
   public int updateHitCount(int num)
   {
      int result = 0;
      
      PreparedStatement pstmt = null;
      String sql = "";
      
      try
      {
         sql = "UPDATE TBL_BOARD SET HITCOUNT = HITCOUNT +1 WHERE NUM = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         
         result = pstmt.executeUpdate();

         pstmt.close();
         
      }catch(Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result; 
   }//end updateHitCount(int num)
   
   // 특정 게시물의 내용을 읽어오는 메소드 정의
   public BoardDTO getReadData(int num)
   {
      BoardDTO result = null;
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try
      {
         sql = "SELECT NUM, NAME, PWD, EMAIL, SUBJECT, CONTENT, HITCOUNT, IPADDR"
               + ", TO_CHAR(CREATED, 'YYYY-MM-DD') AS CREATED"
               + " FROM TBL_BOARD WHERE NUM=?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery();
         
         if (rs.next())
         {
            result = new BoardDTO();
            result.setNum(rs.getInt("NUM"));
            result.setName(rs.getString("NAME"));
            result.setPwd(rs.getString("PWD"));
            result.setEmail(rs.getString("EMAIL"));
            result.setSubject(rs.getString("SUBJECT"));
            result.setContent(rs.getString("CONTENT"));
            result.setHitCount(rs.getInt("HITCOUNT"));
            result.setIpAddr(rs.getString("IPADDR"));
            result.setCreated(rs.getString("CREATED"));
         }   
         
         rs.close();
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      return result;
      
   }//end getReadData(int num)
   
   // 특정 게시물을 삭제하는 기능의 메소드
   public int deleteData(int num)
   {
      int result = 0;
      
      PreparedStatement pstmt = null;
      String sql = "";
      
      try
      {
         sql = "DELETE FROM TBL_BOARD WHERE NUM=?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         result = pstmt.executeUpdate();
         
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return result;
      
   }// end deleteData(int num)
   
   
   // 특정 게시물을 수정하는 기능의 메소드
   public int updateData(BoardDTO dto) 
   {
      int result = 0;
      
      PreparedStatement pstmt = null;
      String sql = "";
      
      try
      {
         sql = "UPDATE TBL_BOARD"
               + " SET NAME=?, PWD=?, EMAIL=?, SUBJECT=?, CONTENT=?"
               + " WHERE NUM=?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, dto.getName());
         pstmt.setString(2, dto.getPwd());
         pstmt.setString(3, dto.getEmail());
         pstmt.setString(4, dto.getSubject());
         pstmt.setString(5, dto.getContent());
         pstmt.setInt(6, dto.getNum());
         
         result = pstmt.executeUpdate();
         
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      return result;
   }// end updateData(BoardDTO dto)
   
   
   // 특정 게시물의 이전 게시물 번호를 얻어내는 메소드 정의
   // 이전 게시물이 존재하지 않을 경우 -1 반환
   public int getBeforeNum(int num) 
   {
      int result = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try
      {
    	  /*
         sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM"
               + " FROM TBL_BOARD WHERE NUM>?";
         */
         sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM"
                 + " FROM TBL_BOARD WHERE NUM<?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         
         rs = pstmt.executeQuery();
         
         if(rs.next())
            result = rs.getInt(1);
         
         rs.close();
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
      
      
      return result;
   }
   
   
   // 특정 게시물의 다음 게시물 번호를 얻어내는 메소드 정의
   // 다음 게시물이 존재하지 않을 경우 -1 반환
   // 다정다정다정아~~~~넹        메소드 이름이 getNextNum 인데.... 쿼리문은 BeforeNum ....
   public int getNextNum(int num) 
   {
      int result = 0;
      
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = "";
      
      try
      {
    	  /*
         sql = "SELECT NVL(MAX(NUM), -1) AS BEFORENUM"
               + " FROM TBL_BOARD WHERE NUM>?";
               */
    	  sql = "SELECT NVL(MIN(NUM), -1) AS NEXTNUM"
                  + " FROM TBL_BOARD WHERE NUM>?";
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         
         rs = pstmt.executeQuery();
         
         if(rs.next())
            result = rs.getInt(1);
         
         rs.close();
         pstmt.close();
         
      } catch (Exception e)
      {
         System.out.println(e.toString());
      }
   
      return result;
   }

}
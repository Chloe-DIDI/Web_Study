/*==============================================
   MemberDTO.java
   -사용자 정의 자료형 클래스(1명의 회원 속성)
===============================================*/
package com.test;

public class MemberDTO
{
	// 주요 속성 구성
	/* 이름, 전화번호, 주소 */
	private String name, tel, addr; 
	
	// default 생성자
	public MemberDTO()
	{
	}
	
	// 사용자 정의 생성자
	public MemberDTO(String name, String tel, String addr)
	{
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}

	// getter / setter 구성
	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getAddr()
	{
		return addr;
	}

	public void setAddr(String addr)
	{
		this.addr = addr;
	}

	
	
}
/*===========================
 		Calc.java
 ==========================*/

/*
 *  ○ 기본적인 계산기 프로그램에 대한 실습(세 가지 방법으로 구현)
 *  
 *     1. 첫 번째 방법
 *        『<%@ page import="com.test.Calc"%>』
 *        구문을 통한 자바 객체 연결
 *        그리고 이를 활용한 객체 생성
 */

package com.test;

public class Calc
{
	// 주요 속성 구성
	private int su1;	//-- 피연산자1 (정수 형태)
	private String op;	//-- 연산자 (문자열 형태)
	private int su2;	//-- 피연산자2 (정수 형태)
	
	// 사용자 정의 생성자 → 정의하지 않음 → default 생성자 자동 삽입
	
	public int getSu1()
	{
		return su1;
	}
	public void setSu1(int su1)
	{
		this.su1 = su1;
	}
	public String getOp()
	{
		return op;
	}
	public void setOp(String op)
	{
		this.op = op;
	}
	public int getSu2()
	{
		return su2;
	}
	public void setSu2(int su2)
	{
		this.su2 = su2;
	}
	
	// 사용자 정의 메소드 추가
	public String result()
	{
		String result = "";
		
		int s=0;
		if(op != null)
		{
			if(op.equals("+"))
				s = su1 + su2;
			else if(op.equals("-"))
				s = su1 - su2;
			else if(op.equals("*"))
				s = su1 * su2;
			else if(op.equals("/"))
				s = su1 / su2;
		
			result = String.format("%d %s %d = %d", su1, op, su2, s);
		}
		return result;
		
	}

	
	
}
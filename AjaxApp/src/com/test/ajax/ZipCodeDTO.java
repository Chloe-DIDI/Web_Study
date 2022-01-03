/*====================
    ZipCodeDTO.java
=====================*/

package com.test.ajax;

public class ZipCodeDTO
{
	// 주요 속성 구성
	private String zipCode;
	private String address;
	
	// 기본 생성자 추가 정의
	public ZipCodeDTO()
	{
		this("", "");
	}
	
	// 생성자 정의
	public ZipCodeDTO(String zipCode, String address)
	{
		this.zipCode = zipCode;
		this.address = address;
	}
	
	
	// getter / setter 구성
	public String getZipCode()
	{
		return zipCode;
	}
	public void setZipCode(String zipCode)
	{
		this.zipCode = zipCode;
	}
	public String getAddress()
	{
		return address;
	}
	public void setAddress(String address)
	{
		this.address = address;
	}
	

}
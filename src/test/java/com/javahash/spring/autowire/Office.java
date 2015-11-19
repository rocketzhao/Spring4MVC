package com.javahash.spring.autowire;

public class Office {

	private String officeNo;

	public String getOfficeNo() {
		return officeNo;
	}

	public void setOfficeNo(String officeNo) {
		this.officeNo = officeNo;
	}

	@Override
	public String toString() {
		return "Office [officeNo=" + officeNo + "]";
	}
}

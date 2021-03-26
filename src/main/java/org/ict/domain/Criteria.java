package org.ict.domain;

import lombok.Data;

@Data
public class Criteria {
	
	private int page;
	private int number;
	
	//Criteria의 기본값이 page 1, number 10이 되도록
	//생성자를 설정합니다.
	public Criteria() {
		this.page = 1;
		this.number = 10;
	}
	
	public int getPageStart() {
		return (this.page -1) * number;
	}
}

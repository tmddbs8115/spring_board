package org.ict.domain;

import lombok.Data;

@Data
public class PageMaker {

	
	private int totalBoard;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	//페이지당 버튼을 몇 개 씩 생성할지
	private int displayPageNum;
	
	//현재 조회중인 페이지를 알아야 버튼을 생성할 수 있음.
	private Criteria cri;
	
	public void calcData() {
		this.displayPageNum = 10;
		
		this.endPage = (int)(Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		
		this.startPage = (endPage - displayPageNum) +1;
		
		int tempEndPage = (int)(Math.ceil(totalBoard / (double)cri.getNumber()));
		
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
				
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getNumber() >= totalBoard ? false : true;
	}
	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
		
		calcData();
	}
	
	
}
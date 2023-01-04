package com.google.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageDTO {

	private int startPage;//시작 페이지
	private int endPage;//끝 페이지
	private boolean prev, next;
	
	private int total;//전체글수
	private Criteria cri;//페이징

	/*
	 * private int realStart; private int realEnd;
	 */
	
	
	public PageDTO(Criteria cri) {
		super();
		this.cri = cri;
	}//cri 초기화
	
	public PageDTO(Criteria cri, int total) {
		super();
		this.total = total;
		this.cri = cri;
		//끝 페이지 번호
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		this.startPage = this.endPage -9;
		int realEnd = (int)(Math.ceil((total*1.0) /cri.getAmount()));
		//(total*1.0) /cri.getAmount()) 한 값을 올립하는 Math.ceil()의 반환값이 Math.ceil라서 int로 캐스팅
	
		if (realEnd < this.endPage) {
			this.endPage=realEnd;		
		}
		
		this.prev = this.startPage>1;
		this.next = this.endPage <realEnd;
	}

	public int getLastPage() {
		return (int)(Math.ceil((total*1.0) /cri.getAmount()));
		
	}

}

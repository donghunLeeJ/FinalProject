package com.project.dto;


public class MemberPagingDTO {
	private int startNavi;
	private int endNavi;
	private boolean needPrev;
	private boolean needNext;
	private int toNext;
	private int toPrev;
	public int getStartNavi() {
		return startNavi;
	}
	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}
	public int getEndNavi() {
		return endNavi;
	}
	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
	}
	public boolean isNeedPrev() {
		return needPrev;
	}
	public void setNeedPrev(boolean needPrev) {
		this.needPrev = needPrev;
	}
	public boolean isNeedNext() {
		return needNext;
	}
	public void setNeedNext(boolean needNext) {
		this.needNext = needNext;
	}
	public int getToNext() {
		return toNext;
	}
	public void setToNext(int toNext) {
		this.toNext = toNext;
	}
	public int getToPrev() {
		return toPrev;
	}
	public void setToPrev(int toPrev) {
		this.toPrev = toPrev;
	}
	public MemberPagingDTO(int startNavi, int endNavi, boolean needPrev, boolean needNext, int toNext, int toPrev) {
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.needPrev = needPrev;
		this.needNext = needNext;
		this.toNext = toNext;
		this.toPrev = toPrev;
	}
	public MemberPagingDTO() {
		super();
	}
	
	
}

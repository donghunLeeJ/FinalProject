package com.project.dto;

//정적 값들(관리자 페이지 count)을 저장시키는 dto임(만일 에러나 다른 문제로 서버가 재실행되면 0으로 초기화됨)
public class ViewDTO {
	
private static int VisitViewCount=0;
private static int BoardNewCount=0;
private static int TradeCount=0;

public ViewDTO(){}

public static int getVisitViewCount() {
	return VisitViewCount;
}
public static void setVisitViewCount(int visitViewCount) {
	VisitViewCount = visitViewCount;
}
public static int getBoardNewCount() {
	return BoardNewCount;
}
public static void setBoardNewCount(int boardNewCount) {
	BoardNewCount = boardNewCount;
}
public static int getTradeCount() {
	return TradeCount;
}
public static void setTradeCount(int tradeCount) {
	TradeCount = tradeCount;
}



}

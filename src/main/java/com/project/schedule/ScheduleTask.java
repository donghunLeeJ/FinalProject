package com.project.schedule;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.project.dto.ViewDTO;

@Component
public class ScheduleTask {

	//자정이 되는 순간 ViewDTO의 값 3개를 0으로 초기화시킨다.
	@Scheduled(cron="0 0 0 * * *")	
	public void ViewInitialization(){	

		System.out.println("밤 12시가 되었으므로 값을 초기화시킵니다.");
		ViewDTO.setVisitViewCount(0);
		ViewDTO.setBoardNewCount(0);
		ViewDTO.setTradeCount(0);	

	}

}

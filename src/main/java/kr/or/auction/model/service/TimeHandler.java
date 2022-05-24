package kr.or.auction.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
public class TimeHandler {
	
	@Autowired
	private AuctionService service;
	
	
	@Scheduled(cron="0 0/10 * * * *")
	public void updateAuction() {
		int result = service.updateAuction();
	}
}

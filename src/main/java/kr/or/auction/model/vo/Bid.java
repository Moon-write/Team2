package kr.or.auction.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Component
public class Bid {
	private int bidNo;
	private int projectNo;
	private int memberNo;
	private int bidAmount;
	private int bidPrice;
	private String bidMsg;
	private String bidDate;
	private int bidSuccess;
	
	// 추가정보
	private String memberName;
}

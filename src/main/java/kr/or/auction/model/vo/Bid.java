package kr.or.auction.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Bid {
	private int bidNo;
	private int projectNo;
	private int memberNo;
	private int bidAmount;
	private int bidPrice;
	private String bidMsg;
	private String bidDate;
	private int bidSuccess;
	private int orderNo;
	
	// 추가정보
	private String memberName;
	
}

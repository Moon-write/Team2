package kr.or.funding.model.vo;

import java.util.ArrayList;

import kr.or.common.model.vo.Order;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Funding {
	private int fundingNo;
	private String fundingName;
	private String fundingCategory;
	private String fundingDetail;
	private String fundingStartDate;
	private String fundingEndDate;
	private int fundingSum;
	private int fundingSumRate;
	private int memberNo;
	private int fundingCurrentSum;
	private int fundingDeadline;
	private String bizName;
	
	// 개인 좋아요여부
	private int like;
	// 좋아요갯수
	private int totallike;
	//멤버아이디 후원금액 가져오기
	//private String memberId;
	//private int orderPrice;
	private int orderCount;
	
	//결제자 정보 불러오기
	private ArrayList<String> memberId;
	private ArrayList<String> orderPrice;
	private ArrayList<Order> orderList;
}

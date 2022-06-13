package kr.or.common.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Order {
	private int orderNo;
	private int divNo;
	private int projectNo;
	private int memberNo;
	private int sellerNo;
	private String orderDate;
	private int orderPrice;
	private int orderPoint;
	
	private String orderDelName;
	private String orderDelPost;
	private String orderDelAddr1;
	private String orderDelAddr2;
	private String orderDelPhone;
	private String orderDelAsk;
	private int orderStatus;
	
	// 프로젝트명
	private String projectName;
	private String[] projectName2;
	// 해당 테이블 외 정보 - 주문상세내역
	private ArrayList<OrderProduct> orderProductList;
	
	//검색용
	private String startDate;
	private String endDate;
}

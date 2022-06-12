package kr.or.common.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class OrderProduct {
	private int productNo;
	private int orderNo;
	private int optionNo;
	private int productPrice;
	private int productAmount;
	
	// 해당 테이블 외 정보 (상품명 정도?)
	private String productName;
	private int[] optionNo2;
	private int[] productPrice2;
	private int[] productAmount2;
}

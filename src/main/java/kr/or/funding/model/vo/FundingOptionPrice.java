package kr.or.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class FundingOptionPrice {
	private int fundingOptionPriceNo;
	private String[] fundingOptionList; //어레이리스트로 해야하나??
	private int[] fundingOptionPrice;
	private int fundingNo;
	
}

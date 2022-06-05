package kr.or.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SelectFundingOptionPrice {
	private int fundingOptionPriceNo;
	private String fundingOptionList;
	private int fundingOptionPrice;
	private int fundingNo;
}

package kr.or.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PaymentData {
	private int fundingNo;
	private String fundingName;
	private int memberNo;
	private int[] amountNumPrice;
	private int[] amountNum;
	private String[] optionNameList;
	private int[] optionPriceNo;
	
	private int amountNumPrice2;
	private int amountNum2;
	private String optionNameList2;
	private int optionPriceNo2;
}

package kr.or.funding.model.vo;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class FundingOption {
	private int fundingOptionNo;
	private String fundingOptionName;
	private String fundingOptionValue;
	private int fundingNo;
}

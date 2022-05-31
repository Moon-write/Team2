package kr.or.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FundingJoinFile {
	private int fundingNo;
	private String fundingName;
	private String fundingCategory;
	private String fundingStartDate;
	private String fundingEndDate;
	private int fundingSum;
	private int fundingSumRate;
	private int fundingCurrentSum;
	private int memberNo;//나중에 이걸로 회사명도 조인해서 가져올 꺼임.
	private String fundingFilePath;
}

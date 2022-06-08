package kr.or.funding.model.vo;

import java.util.ArrayList;

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

}

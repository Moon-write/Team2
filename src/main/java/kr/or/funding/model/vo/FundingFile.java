package kr.or.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class FundingFile {
	private int fundingFileNo;
	private String fundingFilePath;
	private int fundingNo;
}

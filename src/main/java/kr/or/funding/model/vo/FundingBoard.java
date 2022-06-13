package kr.or.funding.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class FundingBoard {
	private int boardNo;
	private int fundingNo;
	private int memberNo;
	private String boardTitle;
	private String boardContent;
	private String boardStartdate;
}

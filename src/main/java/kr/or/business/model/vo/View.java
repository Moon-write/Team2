package kr.or.business.model.vo;

import kr.or.funding.model.vo.Funding;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class View {
	private int divNo;
	private String projectName;
	private int projectNo;
	private String viewDate;
	private int viewCount;
	private int prevCount;
	private int viewDif;
}

package kr.or.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Project {
	private int projectNo;
	private String projectName;
	private String projectEnd;
	private int projectPrice;
	private int divNo;
	private String projectImg;
}

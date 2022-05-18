package kr.or.group.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Group {
	private int projectNo;
	private String projectName;
	private String grpCaption;
	private String grpStart;
	private String grpEnd;
	private String grpContent;
	private int grpCount;
	private int grpOrigPrice;
	private int grpLowest;
	private int grpPrdNo;
	private int memberNo;
	private String grpFilename;
	private String grpFilepath;
	private String thumbname;
	private String thumbpath;
	private String grpCategory;
}

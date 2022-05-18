package kr.or.group.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@AllArgsConstructor
@NoArgsConstructor
@Data
public class GroupOption {
	private int gOptNo;
	private String gName;
	private String gOpt;
	private int grpPrdNo;
	private int gAmount;
	private int projectNo;
}

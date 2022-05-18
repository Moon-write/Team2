package kr.or.common.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Comment {
	private int commentNo;
	private int divNo;
	private int projectNo;
	private int memberNo;
	private String commentContent;
	private String commentDate;
	private int commentRef;
}

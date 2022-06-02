package kr.or.common.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Qna {
	private int qnaNo;
	private int divNo;
	private int projectNo;
	private int memberNo;
	private int sellerNo;
	private String qnaContent;
	private String qnaDate;
	private int qnaRef;
	private int qnaComplete;
}

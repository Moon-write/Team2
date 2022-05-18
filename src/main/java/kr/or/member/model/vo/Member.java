package kr.or.member.model.vo;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private int memberNo;
	private Long bizNo;
	private String bizName;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberPhone;
	private int memberLevel;
	private String memberGender;
	private String memberBirth;
	private String memberPostcode;
	private String memberAddr1;
	private String memberAddr2;
	private int memberPoint;
}

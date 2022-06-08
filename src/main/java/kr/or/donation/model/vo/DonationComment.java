package kr.or.donation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class DonationComment {
	private int donationCommentNo;
	private int projectNo;
	private String memberId;
	private String donationCommentDate;
	private String donationCommentContent;
}

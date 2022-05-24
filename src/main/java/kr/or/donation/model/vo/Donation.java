package kr.or.donation.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Donation {
	private int projectNo; //
	private int memberNo; 
	private int donationDivision;//
	private String donationTitle;//
	private String donationImgname;
	private String donationImgpath;
	private String donationCategory;//
	private String donationContent;//
	private int donationTarget;
	private int donationCash;
	private String donationStartdate;
	private String donationEnddate;
	private int donationSum;
}

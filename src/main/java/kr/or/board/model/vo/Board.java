package kr.or.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Board {
	//펀딩
	private int fundingNo;
	private String fundingName;
	private String fundingCategory;
	private String fundingDetail;
	private String fundingFilepath;
	private String fundingStartDate;
	private String fundingEndDate;
	private int fundingSum;
	private int fundingSumRate;
	private int fundingCurrentSum;
	//기부
	private int donationDivision;
	private String donationTitle;
	private String donationImgname;
	private String donationImgpath;
	private String donationCategory;
	private String donationContent;
	private int donationTarget;
	private int donationCash;
	private String donationStartdate;
	private String donationEnddate;
	private int donationSum;
	//공동구매
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
	//경매
	private int auctionCategory;
	private String auctionItem;
	private int auctionAmount;
	private String auctionStart;
	private String auctionEnd;
	private int auctionPrice;
	private String auctionPic;
	private String auctionContent;
	private int auctionClose;
	//comment
	private int commentNo;
	private int divNo;
	private String commentContent;
	private String commentDate;
	private int commentRef;
	//order
	private int orderNo;
	private int sellerNo;
	private String orderDate;
	private int orderPrice;
	private int orderPoint;
	private int orderStatus;
	//qna
	private int qnaNo;
	private String qnaContent;
	private String qnaDate;
	private int qnaRef;
}


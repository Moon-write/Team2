package kr.or.board.model.vo;

import java.util.ArrayList;

import kr.or.shop.model.vo.ShopPic;
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
	//공동구매(삭제x)
	private int projectNo;
	private String projectName;
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
	private int rnum;
	private int qnaDiv;
	private int qnaStatus;
	private String qnaMemberId;
	private String fundingPN;
	private String donationPN;
	private String auctionPN;
	private String qnaTitle;
	private String qnaContent;
	private String qnaDate;
	private String qnaReContent;
	private String qnaReDate;
	private int secret;
	//member
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
	//shop
	private int shopNo;
	private String shopName;
	private String shopIntro;
	private String shopBirth;
	private String category;
	private int grossIncome;
	private ArrayList<ShopPic> fileList;
}


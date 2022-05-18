package kr.or.auction.model.vo;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Auction {
	private int projectNo;
	private String projectName;
	private int auctionCategory;
	private String auctionItem;
	private int auctionAmount;
	private String auctionStart;
	private String auctionEnd;
	private int memberNo;
	private int auctionPrice;
	private String auctionPic;
	private String auctionContent;
	
	// 테이블 외 내용
	// 최고가
	private int bestPrice;
	// 남은시간
	private String dDate;
	// 입찰리스트
	private ArrayList<Bid> bidList;
	
	
}
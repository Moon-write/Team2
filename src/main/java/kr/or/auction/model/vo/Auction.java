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
	// 입찰건수
	private int bidCount;
	// 남은시간
	private int lastDay;
	private int lastHour;
	private int lastMin;
	private int lastSec;
	// 개인 좋아요여부
	private int like;
	// 사업자상호명
	private String bizName;
	// 입찰리스트
	private ArrayList<Bid> bidList;
	// 좋아요갯수
	private int totallike;
}

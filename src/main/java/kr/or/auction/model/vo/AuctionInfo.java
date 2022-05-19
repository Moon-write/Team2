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
public class AuctionInfo {
	// 입찰리스트
	private ArrayList<Bid> bidList;
	// 좋아요갯수
	private int totallike;
	// 판매자정보
	private String sellerName;
		
}

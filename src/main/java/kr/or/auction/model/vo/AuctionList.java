package kr.or.auction.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class AuctionList {
	private ArrayList<Auction> auctionList;
	private String pagination;
}

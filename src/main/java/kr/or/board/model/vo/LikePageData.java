package kr.or.board.model.vo;

import java.util.ArrayList;

import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Like;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.Qna;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LikePageData {
	private ArrayList<Like> likeList;
	private String pageNavi;
}

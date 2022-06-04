package kr.or.auction.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kr.or.auction.model.service.AuctionService;
import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.AuctionList;
import kr.or.auction.model.vo.Bid;
import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Order;
import kr.or.member.model.vo.Member;

@Controller
public class AuctionController {

	@Autowired
	private AuctionService service;
	
	@RequestMapping(value="addAuction.kh")
	public String addAuction() {
		return "auction/addAuction";
	}
	@RequestMapping(value="addOrder.kh")
	public String addOrder(int orderNo, Model model) {
		// 이 단계에서 주문내역 불러오기 - 보통은 여기서 각자의 프로젝트를 불러온다
		Order order = service.selectOneOrder(orderNo);
		
		model.addAttribute("order", order);
		return "auction/addOrder";
	}

	@RequestMapping(value="auctionList.kh")
	public String auctionList(@SessionAttribute(required=false) Member m, Model model, int reqPage, int startFlag, int endFlag, int order, String searchKeyword) { // 추후 reqPage 변수넣을것
		// 로그인한 회원이 없을 경우 변수 0으로 셋팅
		if(m==null) {
			m = new Member();
			m.setMemberNo(0);
		}
				
		AuctionList auctionList = service.selectAuctionList(m.getMemberNo(), reqPage, startFlag, endFlag, order, searchKeyword); // 로그인 완료되면 변수수정
		
		model.addAttribute("startFlag", startFlag);
		model.addAttribute("order", order); 
		model.addAttribute("endFlag", endFlag);
		model.addAttribute("keyword", searchKeyword);
		model.addAttribute("page", auctionList.getPagination());
		model.addAttribute("list", auctionList.getAuctionList());
		return "auction/auctionList";
	}
	
	@RequestMapping(value="auctionView.kh")
	public String auctionView(@SessionAttribute(required=false) Member m, int projectNo, Model model, RedirectAttributes redirect) {
		// 로그인한 사람의 좋아요여부 가져오기
		if(m==null) {
			m = new Member();
			m.setMemberNo(0);
		}		
		Auction auction = service.selectAuction(projectNo, m.getMemberNo());
				
		if(auction!=null) {
			model.addAttribute("auction", auction);
			return "auction/auctionView";
		}else {
			redirect.addFlashAttribute("msg", "경매가 삭제되었거나 열람이 제한된 상품입니다!");
			return "redirect:/auctionList.kh?startFlag=1&endFlag=1&searchKeyword=&order=1&reqPage=1";		
		}		
	}
	
	@RequestMapping(value="/insertAuction.kh")
	public String insertAuction(@SessionAttribute(required=false) Member m, Auction auction, MultipartFile[] auctionPicture, HttpServletRequest request, Model model) {
		String filepath = null;
		auction.setMemberNo(m.getMemberNo());
		
		if(!auctionPicture[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
			
			MultipartFile file = auctionPicture[0];
			
			filepath = fileIo(file, savePath);
		}else {
			filepath = "preview.jpg";
		}
		auction.setAuctionPic(filepath);
		int result = service.insertAuction(auction);
		
		if(result>0) {
			model.addAttribute("icon", "success");
			model.addAttribute("title", "등록 완료");
			model.addAttribute("msg", "경매 등록이 완료되었습니다!");
			model.addAttribute("loc", "/manageAuction.kh");
		}else {			
			model.addAttribute("icon", "error");
			model.addAttribute("title", "등록 실패");
			model.addAttribute("msg", "경매 등록에 실패했어요! 관리자에게 문의해 주세요.");
			model.addAttribute("loc", "/manageAuction.kh");
		}
		return "common/msg";			
	}
	
	@RequestMapping(value="/previewAuction.kh")
	public String previewAuction(@SessionAttribute(required=false) Member m, Auction auction, MultipartFile[] auctionPicture, HttpServletRequest request, RedirectAttributes redirect) {
		String filepath = null;
		
		if(!auctionPicture[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
			
			MultipartFile file = auctionPicture[0];
			
			filepath = fileIo(file, savePath);
		}else {
			filepath = "preview.jpg";
		}
		auction.setMemberNo(m.getMemberNo());
		auction.setBizName(m.getBizName());
		auction.setAuctionPic(filepath);
		auction.setBestPrice(auction.getAuctionPrice());
		auction.setAuctionStart(auction.getAuctionStart().replace('T', ' '));
		auction.setAuctionEnd(auction.getAuctionEnd().replace('T', ' '));
			
		redirect.addFlashAttribute("msg", "본 페이지는 미리보기입니다.");
		redirect.addFlashAttribute("auction", auction);
		return "/auction/auctionPreview";
	}
	
	@RequestMapping(value="/auctionPay.kh")
	public String auctionPay(Order o, Model model) {
		
		int result = service.updateOrderPay(o);
  		System.out.println(result);
		if(result>0) {
			model.addAttribute("icon", "success");
			model.addAttribute("title", "결제 완료");
			model.addAttribute("msg", "결제가 완료되었습니다!");
			model.addAttribute("loc", "/");
		}else {			
			model.addAttribute("icon", "error");
			model.addAttribute("title", "결제 실패");
			model.addAttribute("msg", "결제에 실패했어요! 주문내역을 다시 확인해 주세요.");
			model.addAttribute("loc", "/addOrder.kh?orderNo="+o.getOrderNo());
		}
		return "common/msg";
	}
	
	@RequestMapping(value="/gotoModifyAuction.kh")
	public String gotoModifyAuction(int projectNo, Model model) {
		Auction a = service.pickOneAuction(projectNo);
		model.addAttribute("a", a);
		return "auction/modifyAuction";	
	}
	
	@RequestMapping(value="/modifyAuction.kh")
	public String modifyAuction(Auction a, MultipartFile[] auctionPicture, HttpServletRequest request, Model model) {
		
		String filepath = null;
		int result = 0;
		
		Auction auction = service.checkUpdatable(a.getProjectNo());

		if(auction!=null) {
			// 불러온 값이 있다 = 수정 가능하다
			if(!auctionPicture[0].isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
				// 원래 있던 파일 삭제
				if(!auction.getAuctionPic().equals("preview.jpg")) {
					// 프로필사진 파일명이 preview가 아니면
					String deleteFile = savePath+auction.getAuctionPic();
					File delFile = new File(deleteFile);
					delFile.delete();					
				}
				
				MultipartFile file = auctionPicture[0];
				
				filepath = fileIo(file, savePath);
				
				a.setAuctionPic(filepath);
			}
			result = service.modifyAuction(a);
		}else {
			// 불러온 값이 없다 = 내용과 프로필만 수정 가능하다

			if(!auctionPicture[0].isEmpty()) {
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
				
				Auction auction2 = service.pickOneAuction(a.getProjectNo());
				
				// 원래 있던 파일 삭제
				if(!auction2.getAuctionPic().equals("preview.jpg")) {
					// 프로필사진 파일명이 preview가 아니면
					String deleteFile = savePath+auction2.getAuctionPic();
					File delFile = new File(deleteFile);
					delFile.delete();					
				}
				
				MultipartFile file = auctionPicture[0];
				
				filepath = fileIo(file, savePath);
				
				a.setAuctionPic(filepath);
			}
			result = service.modifyAuctionContent(a);
		}
				
		if(result>0) {
			model.addAttribute("icon", "success");
			model.addAttribute("title", "수정 완료");
			model.addAttribute("msg", "경매 진행정보가 수정되었습니다!");
			model.addAttribute("loc", "/exitPage.kh");
		}else {			
			model.addAttribute("icon", "error");
			model.addAttribute("title", "수정 실패");
			model.addAttribute("msg", "수정에 실패했어요! 관리자에게 문의하세요!");
			model.addAttribute("loc", "/exitPage.kh");
		}
		return "common/msg";
	}
	@RequestMapping(value="exitPage.kh")
	public String exitPage() {
		return "auction/exit";
	}
	@ResponseBody
	@RequestMapping(value="/addLike.kh")
	public String addLike(@SessionAttribute(required=false) Member m, String projectNo) {
		int result = service.addLike(m.getMemberNo(), Integer.parseInt(projectNo));
		
		return Integer.toString(result);
	}

	@ResponseBody
	@RequestMapping(value="/removeLike.kh")
	public String removeLike(@SessionAttribute(required=false) Member m, int projectNo) {
		int result = service.removeLike(m.getMemberNo(), projectNo);
		
		return Integer.toString(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/checkMyLikeCount.kh")
	public String checkMyLikeCount(@SessionAttribute(required=false) Member m) {
		int	result  = service.checkMyLikeCount(m.getMemberNo());
		
		
		return Integer.toString(result);
	}
	
	@ResponseBody
	@RequestMapping(value="getBidCount.kh")
	public String getBidCount(int projectNo) {
		int result = service.getBidCount(projectNo);
		
		return Integer.toString(result);
	}

	
	@ResponseBody
	@RequestMapping(value="/selectLikeList.kh", produces="application/json; charset=utf-8")
	public String selectLikeList(@SessionAttribute(required=false) Member m, int pageNo) {
		if(m==null) {
			return null;
		}
		ArrayList<Auction> list = service.selectLikeList(m.getMemberNo(), pageNo);		
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value="/selectCommentList.kh", produces="application/json; charset=utf-8")
	public String selectCommentList(int projectNo, int pageNo) {

		ArrayList<Comment> list = service.selectCommentList(projectNo, pageNo);		
		
		return new Gson().toJson(list);
	}

	
	
	@ResponseBody
	@RequestMapping(value="/bidUpdate.kh", produces="application/json; charset=utf-8")
	public String bidUpdate(int projectNo) {

		ArrayList<Bid> list = service.getBidList(projectNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/bidHistory.kh", produces="application/json; charset=utf-8")
	public String bidHistory(int projectNo) {

		ArrayList<Bid> list = service.getBidHistory(projectNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/addComment.kh", produces="application/json; charset=utf-8")
	public String addComment(@SessionAttribute(required=false) Member m, Comment c) {
		c.setMemberNo(m.getMemberNo());		
		c = service.addComment(c);
		if(c==null) {
			return "error";
		}else {
			return new Gson().toJson(c);
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/selectOneComment.kh", produces="application/json; charset=utf-8")
	public String selectOneComment(Comment c) {
		c = service.selectOneComment(c);
		
		return new Gson().toJson(c);
	}
	@ResponseBody
	@RequestMapping(value="/modifyComment.kh")
	public String modifyComment(Comment c) {
		int result = service.modifyComment(c);
		
		return Integer.toString(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteComment.kh")
	public String deleteComment(Comment c) {
		int result = service.deleteComment(c);
		return Integer.toString(result);
	}
	
	@ResponseBody
	@RequestMapping(value="checkCommentCount.kh")
	public String checkCommentCount(Comment c) {
		int result = service.checkCommentCount(c);
		
		return Integer.toString(result);
	}
	
	@ResponseBody
	@RequestMapping(value="/auctionImgUpload.kh")
	public String auctionImgUpload(@RequestParam("file") MultipartFile[] file, HttpServletRequest request ) {
		String filepath = null;
		
		if(!file[0].isEmpty()) {
			// 사진이 있을때만 로직 실행
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
			
			MultipartFile onefile = file[0];
			
			filepath = fileIo(onefile, savePath);
		}
		return "../../../resources/upload/auction/"+filepath;
	}

	// 파일1개와 저장위치를 넣고 최종 저장 파일명을 리턴해주는 메소드
	private String fileIo(MultipartFile file, String savePath) {
		String filepath = null;
		
		String filename = file.getOriginalFilename();
		String onlyFilename = filename.substring(0,filename.lastIndexOf("."));
		String extention = filename.substring(filename.lastIndexOf("."));
		
		int count = 0;
		
		while(true) {
			if(count==0) {
				filepath = onlyFilename+extention;
			}else {
				filepath = onlyFilename+"_"+count+extention;
			}
			// 중복검사
			File checkFile = new File(savePath+filepath);
			if(!checkFile.exists()) {
				break;
				// 파일이 존재 안해야 해당 파일명을 사용할 수 있다.
			}
			count++;
		}
		
		try {
			FileOutputStream fos = new FileOutputStream(new File(savePath+filepath));
			BufferedOutputStream bos =new BufferedOutputStream(fos);
			
			byte[] bytes = file.getBytes();
			bos.write(bytes);
			bos.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return filepath; // 파일명 리턴
	} // 파일업로드 메소드 종료
	
} // 컨트롤러 종료
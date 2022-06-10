package kr.or.shop.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.auction.model.vo.Auction;
import kr.or.auction.model.vo.AuctionList;
import kr.or.donation.model.service.DonationService;
import kr.or.donation.model.vo.Donation;
import kr.or.member.model.service.MemberService;
import kr.or.member.model.vo.Member;
import kr.or.shop.model.service.ShopService;
import kr.or.shop.model.vo.Shop;
import kr.or.shop.model.vo.ShopCategory;
import kr.or.shop.model.vo.ShopPic;

@Controller
public class ShopController {
	@Autowired
	private ShopService service;

	@Autowired
	private MemberService mService;
	
	@Autowired
	private DonationService dService;

	@RequestMapping(value = "/updateInfo.kh")
	public String updateInfo(int memberNo, Model model) {
		Shop shop = service.selectShopInfo(memberNo);
		ArrayList<ShopCategory> category = service.selectCategory(shop.getShopNo());
		ArrayList<Donation> list = service.selectDonationList(memberNo);
		ArrayList<Donation> generalList = new ArrayList<Donation>();
		ArrayList<Donation> cashList = new ArrayList<Donation>();
		String noImgPath = "../../../resources/upload/donation/no_image.png";
		for(Donation d: list) {
			if(d.getDonationDivision()==2) {
				if(d.getDonationImgpath() == null) {
					d.setDonationImgpath(noImgPath);
				}
				cashList.add(d);
			}else {
				if(d.getDonationImgpath() == null) {
					d.setDonationImgpath(noImgPath);
				}
				generalList.add(d);
			}
		}
		ArrayList<Auction> auctionList= service.selectAuctionList(memberNo); // 로그인 완료되면 변수수정
		
		model.addAttribute("auctionList", auctionList);
		model.addAttribute("list", list);
		model.addAttribute("cashList",cashList);
		model.addAttribute("generalList",generalList);
		model.addAttribute("shop", shop);
		model.addAttribute("category", category);
		return "shop/updateInfo";
	}
	
	@RequestMapping(value = "/shopInfo.kh")
	public String shopInfo(int memberNo, Model model) {
		int sn=service.selectShopNo(memberNo);
		Shop shop = service.selectShop(sn);
		ArrayList<ShopCategory> category = service.selectCategory(sn);
		
		model.addAttribute("shop", shop);
		model.addAttribute("category", category);
		return "shop/shopInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/selectAuctionList.kh", produces="application/json; charset=utf-8")
	public String selectAuctionList(int shopNo) {
		Shop shop=service.selectShop(shopNo);
		ArrayList<Auction> list = service.selectAuctionList(shop.getMemberNo());		
		return new Gson().toJson(list);
	}

	@ResponseBody
	@RequestMapping(value="/selectFundingList.kh", produces="application/json; charset=utf-8")
	public String selectFundingList(int shopNo) {
		Shop shop=service.selectShop(shopNo);
		ArrayList<Auction> list = service.selectFundingList(shop.getMemberNo());		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectDonationList.kh", produces="application/json; charset=utf-8")
	public String selectDonationList(int shopNo) {
		Shop shop=service.selectShop(shopNo);
		ArrayList<Donation> list = service.selectDonationList(shop.getMemberNo());
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value="/selectFundingFile.kh", produces="application/json; charset=utf-8")
	public String selectFundingFile(int fundingNo) {
		String file = service.selectFundingFile(fundingNo);		
		return new Gson().toJson(file);
	}
	
	@RequestMapping(value = "/shopUploadFrm.kh")
	public String shopUploadFrm() {
		return "shop/shopUploadFrm";
	}

	@RequestMapping(value = "/picUpload.kh")
	public String picUpload(Shop shop, MultipartFile[] upfile, HttpServletRequest request) {
		ArrayList<ShopPic> fileList = new ArrayList<ShopPic>();
		if (upfile[0].isEmpty()) {
		} else {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/shopPic/");
			for (MultipartFile file : upfile) {
				String filename = file.getOriginalFilename();
				String onlyFilename = filename.substring(0, filename.lastIndexOf("."));
				String extention = filename.substring(filename.lastIndexOf("."));
				String filepath = null;
				int count = 0;
				while (true) {
					if (count == 0) {
						filepath = onlyFilename + extention;
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);
					if (!checkFile.exists()) {
						break;
					}
					count++;
				}

				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					byte[] bytes = file.getBytes();
					bos.write(bytes);
					bos.close();
				} catch (FileNotFoundException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				ShopPic shopPic = new ShopPic();
				shopPic.setShopFilename(filename);
				shopPic.setShopFilepath(filepath);
				fileList.add(shopPic);
			}
		}
		int result = service.insertShopPic(shop, fileList);
		return "redirect:updateInfo.kh?memberNo="+shop.getMemberNo();
	}

	@RequestMapping(value = "/managePic.kh")
	public String managePic(int memberNo, Model model) {
		ArrayList<ShopPic> sp = service.selectShopPicList(memberNo);
		Shop shop = service.selectShopInfo(memberNo);		
		model.addAttribute("shop", shop);
		model.addAttribute("sp", sp);
		return "shop/managePic";
	}
	@RequestMapping(value = "/editIntro.kh")
	public String editIntro(int shopNo, String shopIntro, int memberNo) {
		if(shopIntro.isEmpty()) {
			shopIntro=" ";
		}
		int result=service.insertShopIntro(shopNo,shopIntro);
		return "redirect:updateInfo.kh?memberNo="+memberNo;
	}

	@RequestMapping(value="/deleteShopPic.kh")
	public String deleteShopPic(int memberNo, String shopPicNos,HttpServletRequest request) {
		/*
		ArrayList<ShopPic> sp = service.selectDelPicList(shopPicNos);
		for(int i=0;i<sp.size();i++) {
			String path="C:\\Users\\A\\git\\Team2\\src\\main\\webapp\\resources\\upload\\shopPic"+sp.get(i).getShopFilepath();
			File file = new File(path);
			if(file.exists()){
				System.out.println("파일을 삭제하였습니다");
				file.delete();
			}
		}
		*/
		int result = service.deleteShopPic(shopPicNos);
		return "redirect:updateInfo.kh?memberNo="+memberNo;
	}
	
	@RequestMapping(value="/deleteCategory.kh")
	public String deleteCategory(int memberNo, String categories, HttpServletRequest request) {
		int result=service.deleteCategory(categories);
		return "redirect:updateInfo.kh?memberNo="+memberNo;
	}
	
	@RequestMapping(value="/insertCategory.kh")
	public String insertCategory(int memberNo, int shopNo, String categories, HttpServletRequest request) {
		int result=service.insertCategory(shopNo, categories);
		return "redirect:updateInfo.kh?memberNo="+memberNo;
	}
	@ResponseBody
	@RequestMapping(value="/updateBizMember.kh")
	public String updateBizMember(Member m, HttpSession session) {
		int result = service.updateBizMember(m);
		Member member = mService.selectOneMember(m);
		if(result > 0 && member != null ) {
			session.setAttribute("m", member);
			return "0";
		}else {
			return "1";
		}
	}
}

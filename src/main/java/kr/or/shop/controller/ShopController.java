package kr.or.shop.controller;

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
import org.springframework.web.multipart.MultipartFile;

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

	@RequestMapping(value = "/updateInfo.kh")
	public String updateInfo(int memberNo, Model model) {
		Shop shop = service.selectShopInfo(memberNo);
		ArrayList<ShopCategory> category = service.selectCategory(shop.getShopNo());
		model.addAttribute("shop", shop);
		model.addAttribute("category", category);
		return "shop/updateInfo";
	}

	@RequestMapping(value = "/shopUploadFrm.kh")
	public String shopUploadFrm(int memberNo, Model model) {
		Shop shop = service.selectShopInfo(memberNo);
		Member member=service.selectOneMember(memberNo);
		model.addAttribute("shop", shop);
		model.addAttribute("member", member);
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
		return "business/business";
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
	public String deleteShopPic(String shopPicNos,HttpServletRequest request) {
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
		System.out.println(shopPicNos);
		return "business/business";
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
	@RequestMapping(value = "/shopInfo.kh")
	public String shopInfo(int memberNo, Model model) {
		Shop shop = service.selectShopInfo(memberNo);
		ArrayList<ShopCategory> category = service.selectCategory(shop.getShopNo());
		model.addAttribute("shop", shop);
		model.addAttribute("category", category);
		return "shop/shopInfo";
	}
}

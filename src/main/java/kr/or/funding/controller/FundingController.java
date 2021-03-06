package kr.or.funding.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.or.common.model.vo.Comment;
import kr.or.common.model.vo.Order;
import kr.or.common.model.vo.OrderProduct;
import kr.or.funding.model.service.FundingService;
import kr.or.funding.model.vo.Funding;
import kr.or.funding.model.vo.FundingBoard;
import kr.or.funding.model.vo.FundingFile;
import kr.or.funding.model.vo.FundingJoinFile;
import kr.or.funding.model.vo.FundingOption;
import kr.or.funding.model.vo.FundingOptionPrice;
import kr.or.funding.model.vo.PaymentData;
import kr.or.member.model.vo.Member;

@Controller
public class FundingController {
	@Autowired
	private FundingService service;

	@RequestMapping(value = "/fundingInsert.kh")
	public String FundingInput() {
		return "funding/fundingInsertFrm";
	}

	
	@RequestMapping(value = "/test.kh")
	public String test(MultipartFile[] upfile) {
		System.out.println("파일길이 :"+upfile.length);
		return "funding/fundingInsertSuccess";
	}
	@RequestMapping(value = "/fundingInsertFrm.kh")
	public String FundingInsertFrm(MultipartFile[] upfile,Funding f,FundingOptionPrice fop, HttpServletRequest request,@SessionAttribute(required=false) Member m,Model model) {
		System.out.println("------Funding f------");
		System.out.println("펀딩네임 : "+f.getFundingName());
		System.out.println("펀딩카테고리 : "+f.getFundingCategory());
		System.out.println("펀딩디테일써머놑 : "+f.getFundingDetail());
		System.out.println("펀딩종료날짜 : "+f.getFundingEndDate());
		System.out.println("펀딩옵션리스트 : "+fop.getFundingOptionList());
		System.out.println("펀딩옵션리스트가격 : "+fop.getFundingOptionPrice());
		System.out.println("비즈니스네임 : "+m.getBizName());
		f.setBizName(m.getBizName());
		f.setMemberNo(m.getMemberNo());

		for(int i = 0; i< fop.getFundingOptionList().length;i++) {
			System.out.println(fop.getFundingOptionList());
		}
		
		for(int i = 0; i< fop.getFundingOptionPrice().length;i++) {
			System.out.println(fop.getFundingOptionPrice());
		}
		
		
		//System.out.println(f.getFundingCategory());
		System.out.println("파일 개수 : "+upfile.length);//파일업로드 잘들어오는지 확인용
		// System.out.println(f); 입력값 잘 들어오는지확인
		//Funding f,,FundingOptionPrice fop,HttpServletRequest request
		
		// 파일목록을 저장할 리스트를 생성 >>**안필요 할 수 도있음
		ArrayList<FundingFile> fundingList = new ArrayList<FundingFile>();
		// 멀티파일 배열을 첨부파일의 갯수만큼 길이가생성 (단 , 첨부파일이 없어도 기리는 무조건 1)
		// 첨부파일이 없는경우는 배열의 첫번쨰 파이링 비어 있는지 체크하는 방식
		if (upfile[0].isEmpty()) {
			// 첨부파일이 있는겨웅 파일업로드 작업진행
		} else {
			// 첨부파일이 있는경우 파일업로드 작업 진행
			// 1. 파일업로드 경로 설정(HttrServletReqyest 객체를 이용해서 경로 구해옴) // resource폴더에 css나 사진 이미지
			// 등 모아넣기//
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/funding/");
			// 2.반복문을 이용한 파일업로드 처리

			for (MultipartFile file : upfile) {
				// 파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새 파일만 남는 현사잉 생김(덮어쓰기)
				// 파일명 중복처리
				// 사용자가 업로드한 파일이름
				String filename = file.getOriginalFilename();
				// test.txt ->test_1.txt 로 저장되게 할 것
				String onlyFilename = filename.substring(0, filename.lastIndexOf("."));// 서브스트링이 잘라내는건데 라스트인덱스 뒤에서부터 "."
																						// 바로 앞까지 부등호 생각하면 됨
				String extention = filename.substring(filename.lastIndexOf("."));// 매개변수가 filename.lastIndexOf(".") 하나
																					// 이므로, "."부터 끝까지
				// 실제 업로드 할 파일명을 저장할 변수
				String filepath = null; // fundingFilepath로 변수 변경해서 사용해야하려나?
				int count = 0;
				while (true) {// 숫자를 붙이더라도 더이상 중복이 안될떄까지 하려고 무한 반복
					if (count == 0) {
						// 반복 첫번쨰 회차에는 원본 파일명을 그대로 적용
						filepath = onlyFilename + extention;// test.txt
					} else {
						filepath = onlyFilename + "_" + count + extention;
					}
					File checkFile = new File(savePath + filepath);// 파일하나 만들어보는거 File java.io 클래스
					if (!checkFile.exists()) {// 만약에 이 파이링름이 존재하면 true 아니면 false
						break;
					}
					count++;
				}

				// 파일명 중복검사가 끝난 시점

				try {
					FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
					// 업로드 속도증가를 위한 보조스트림 생성
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					// 파일업로드
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
				// 서버 파일 업로드 끝(파일1개단위) 여기까지가 멀티파티리퀘스트 객체만든거 수작업으로 진행한 것.
				///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
				// 이제 위에서만든 리스트를 이용해서 DB에 넣는작업
				FundingFile fundingFilePath = new FundingFile();	
				fundingFilePath.setFundingFilePath(filepath);
				fundingList.add(fundingFilePath);
				

			}
		}
		//성공 실패시 결과 RESULT 비교 해줄것 지금 안해놨음
		int result = service.insertFunding(f,fop,fundingList);
		System.out.println("최종 insert result 값 : "+result);
		
		System.out.println("fundingList : "+ fundingList);
		if(result>0) {
			model.addAttribute("icon", "success");
			model.addAttribute("title", "등록 완료");
			model.addAttribute("msg", "펀딩등록이 완료되었습니다!");
			model.addAttribute("loc", "/manageFunding.kh");
		}else {			
			model.addAttribute("icon", "error");
			model.addAttribute("title", "등록 실패");
			model.addAttribute("msg", "펀딩 등록에 실패했습니다! 다시한번 확인해주세요.");
			model.addAttribute("loc", "/manageFunding.kh");
		}
		return "common/msg";	
	}

	@ResponseBody
	@RequestMapping(value = "/optionCategoryAjax.kh", produces = "application/json;charset=utf-8")
	public String optionCategoryAjax(@RequestParam(value="fundingOptionNameArr[]") List<String> fundingOptionNameArr, @RequestParam(value="fundingOptionValueArr[]") List<String> fundingOptionValueArr) {
		//아작스에서 배열로 보내준거 받기위해 RequestParam작성해주고, List로 받아야함
		
		//System.out.println(fundingOptionNameArr);
		//System.out.println(fundingOptionValueArr);
		//System.out.println(fundingOptionNameArr.get(0));
		
		System.out.println("옵션값 토크나이저 X!!!!!!!!!!!!!!!!!!!!!!!!! : "+fundingOptionValueArr);///////////////////////////////////////////////이게문제
		
		HashMap<String, ArrayList<String>> optionList = new HashMap<String,ArrayList<String>>(); //옵션리스트를 담을 해쉬맵
		for(int i = 0 ; i<fundingOptionNameArr.size(); i++) {
			System.out.println(fundingOptionNameArr.size());
			System.out.println("옵션이름 : "+fundingOptionNameArr.get(i));
			System.out.println("옵션값 : "+fundingOptionValueArr.get(i));
			//tokenizer(fundingOptionValueArr.get(i));//ArrayList<String> (0,블랙),(1,화이트)
			optionList.put(fundingOptionNameArr.get(i), tokenizer(fundingOptionValueArr.get(i)));//토크나이저 어레이리스트
			System.out.println("토크나이저 : "+i+tokenizer(fundingOptionValueArr.get(i)));
			System.out.println("조합 : "+optionList.get(fundingOptionNameArr.get(i)));
		}
		ArrayList<String> finalResult = null;
		if(optionList.size() == 1) {//사이즈가 1일 때
			finalResult = optionList.get(fundingOptionNameArr.get(0));
			System.out.println("파이널리저트 1개 : "+finalResult);
		}else {// 리스트의 개수가 2개이상부터
			for(int j=0;j<fundingOptionNameArr.size()-1;j++) {
				if(finalResult == null) {//1개가 아니고 처음 실행단계일때
					String option1 = fundingOptionNameArr.get(0);//맛 을 가져왔음
					ArrayList<String> list1 = optionList.get(option1);//맛일때 포도 딸기 바나나를 어레이리스트에 넣음
					finalResult = optionList.get(fundingOptionNameArr.get(j));//처음에 final리저트에넣고 
				}
				//여기는 그냥 이전 리스트값에다가 다음리스트값을 이어주는 메소드실행부분 처음단계 외에는 if(finalResult == null)부분 패스하고 여기서부터 실행되는거
				ArrayList<String> list2 = optionList.get(fundingOptionNameArr.get(j+1));
				finalResult = plusList(finalResult, list2);	
			}			
		}
		
		for(String str : finalResult) {

			System.out.println("옵션 최종조합 "+str);
		}
		
				
		
		/*
		 * for(int i=0; i<fundingOptionNameArr.length;i++) {
		 * System.out.println(fundingOptionNameArr[i]);
		 * System.out.println(fundingOptionValueArr[i]); }
		 */
		/*
		 * System.out.println(fundingOptionName.get(0));
		 * System.out.println(fundingOptionValue.get(0));
		 * 
		 * for(int i=0;i<fundingOptionName.size();i++) { System.out.println("펀딩옵션이름 : "
		 * + fundingOptionName.get(i)); System.out.println("펀딩옵션 : " +
		 * fundingOptionValue.get(i)); }
		 */
		 

		
		Gson gson = new Gson();
		return gson.toJson(finalResult);

	}
	@RequestMapping(value="/fundingAllList.kh")
	public String FundingAllList(Model model,int selectedInquire) {

		ArrayList<FundingJoinFile> list = service.fundingAllList(selectedInquire);
		model.addAttribute("list",list);
		model.addAttribute("selectedInquire", selectedInquire);
		return "funding/fundingAllList";		
	}
	@RequestMapping(value="/fundingList.kh")
	public String FundingAllList(Model model,int selectedInquire,Funding f) {
		System.out.println(f.getFundingCategory());
		System.out.println(selectedInquire);
		
		ArrayList<FundingJoinFile> list = service.selectFundingListCategory(selectedInquire,f);
		model.addAttribute("list",list);
		model.addAttribute("selectedInquire", selectedInquire);
		model.addAttribute("categoryParameter",f.getFundingCategory());
		return "funding/fundingList";		
	}
	
	
	///////////////////fundingDetail////////////////////////////////////////////////////////////
	@RequestMapping(value="/fundingDetailStory.kh")
	public String FundingDetailStory(int fundingNo, Model model) { //int fundingNo대신 funding funding으로 받음
		Funding f = service.selectOneFunding(fundingNo);
		ArrayList<FundingFile> list = service.selectOneFundingFile(fundingNo);
		model.addAttribute("list",list);
		model.addAttribute("f",f);
		return "funding/fundingDetailStory";
	}/*
	@RequestMapping(value="/fundingDetailCommunity.kh")
	public String FundingDetailCommunity(Funding funding, Model model) {
		Funding f = service.selectOneFundingRight(funding.getFundingNo());
		model.addAttribute("f",f);
		return "funding/fundingDetailCommunity";
	}
	@RequestMapping(value="/fundingDetailNotice.kh")
	public String FundingDetailNotice(Funding funding, Model model) {
		Funding f = service.selectOneFundingRight(funding.getFundingNo());
		int fundingNo = f.getFundingNo();// 펀딩 번호입니다
		ArrayList<FundingBoard> fb = service.selectFundingBoard(fundingNo); //게시판불러오기(임재형)
		model.addAttribute("f",f);
		model.addAttribute("fb",fb); //펀딩 디테일에 들어가는 테이블입니다.
		return "funding/fundingDetailNotice";
	}
	*/
	@RequestMapping(value="/fundingBoardDetail.kh") //게시판 상세페이지 추가로직(임재형)
	public String fundingBoardDetail(int boardNo,Model model) {
		FundingBoard fb = service.selectOneFundingBoard(boardNo);
		model.addAttribute("fb",fb);
		return "funding/fundingBoardDetail";
	}
	@RequestMapping(value="/fundingDetailSupporter.kh")
	public String FundingDetailSupporter(Funding funding, Model model) {
		System.out.println(funding.getFundingNo());
		Funding f = service.selectOneFundingSupporter(funding.getFundingNo());
		
		
		model.addAttribute("f",f);

		return "funding/fundingDetailSupporter";
	}
	@RequestMapping(value="/selectFundingOptionPrice.kh")
	public String SelectFundingOptionPrice(int fundingNo,Model model) {
		ArrayList<FundingOptionPrice> list = service.selectFundingOptionPrice(fundingNo);
		Funding f = service.selectOneFunding2(fundingNo);
		model.addAttribute("list", list);
		model.addAttribute("f",f);
		return "funding/selectFundingOptionPrice";
	}
	@RequestMapping(value="/fundingNoticeFrm.kh")
	public String FundingNoticeFrm(@SessionAttribute(required=false) Member m,Model model) {
			model.addAttribute("m",m);
		return "funding/fundingNoticeFrm";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/selectExpiredFList.kh", produces =
	 * "application/json;charset=utf-8") public String SelectExpiredFundingList(int
	 * memberNo) { ArrayList<Funding> f = service.selectFundingListMember(memberNo);
	 * for(int i=0; i<f.size(); i++) { System.out.println(f.get(i).getFundingNo());
	 * } Gson gson = new Gson(); return gson.toJson(f); }
	 */
	
	@RequestMapping(value="/fundingUpdateFrm.kh")
	public String FundingUpdateFrm(Funding funding,Model model) {
		System.out.println(funding.getMemberNo());
		System.out.println(funding.getFundingNo());
		Funding f = service.selectOneFundingMemberNo(funding);
		f.setFundingEndDate(f.getFundingEndDate().substring(0, 16));
		ArrayList<FundingFile> filelist = service.selectOneFundingFile(funding.getFundingNo());
		ArrayList<FundingOptionPrice> optionList = service.selectFundingOptionPrice(funding.getFundingNo());
		model.addAttribute("f",f);
		model.addAttribute("filelist",filelist);
		model.addAttribute("optionList",optionList);
		return "funding/fundingUpdateFrm"; 
	}
	
	@RequestMapping(value="/fundingUpdate.kh")
	public String FundingUpdate(Funding f,FundingOptionPrice fop,@SessionAttribute(required=false) Member m,MultipartFile[] upfile, HttpServletRequest request,Model model,int[] deleteFundingFileNo) {
		
		if(deleteFundingFileNo!=null) {
		for(int i =0;i<deleteFundingFileNo.length ;i++) {
			System.out.println("삭제돼야하는파일번호 : "+deleteFundingFileNo[i]);
		}
		}
		System.out.println("------Funding f------");
		System.out.println("펀딩네임 : "+f.getFundingName());
		System.out.println("펀딩카테고리 : "+f.getFundingCategory());
		System.out.println("펀딩디테일써머놑 : "+f.getFundingDetail());
		System.out.println("펀딩종료날짜 : "+f.getFundingEndDate());
		System.out.println("펀딩옵션리스트 : "+fop.getFundingOptionList());
		System.out.println("펀딩옵션리스트가격 : "+fop.getFundingOptionPrice());
		f.setBizName(m.getBizName());
		f.setMemberNo(m.getMemberNo());
		System.out.println("비즈니스네임 : "+f.getBizName());
		System.out.println("파일 개수 : "+upfile.length);

		for(int i = 0; i< fop.getFundingOptionList().length;i++) {
			System.out.println(fop.getFundingOptionList()[i]);
		}
		
		for(int i = 0; i< fop.getFundingOptionPrice().length;i++) {
			System.out.println(fop.getFundingOptionPrice()[i]);
		}
		// 파일목록을 저장할 리스트를 생성 >>**안필요 할 수 도있음
				ArrayList<FundingFile> fundingList = new ArrayList<FundingFile>();
				// 멀티파일 배열을 첨부파일의 갯수만큼 길이가생성 (단 , 첨부파일이 없어도 기리는 무조건 1)
				// 첨부파일이 없는경우는 배열의 첫번쨰 파이링 비어 있는지 체크하는 방식
				if (upfile[0].isEmpty()) {
					// 첨부파일이 있는겨웅 파일업로드 작업진행
				} else {
					// 첨부파일이 있는경우 파일업로드 작업 진행
					// 1. 파일업로드 경로 설정(HttrServletReqyest 객체를 이용해서 경로 구해옴) // resource폴더에 css나 사진 이미지
					// 등 모아넣기//
					String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/funding/");
					// 2.반복문을 이용한 파일업로드 처리

					for (MultipartFile file : upfile) {
						// 파일명이 기존파일과 겹치는 경우 기존파일을 삭제하고 새 파일만 남는 현사잉 생김(덮어쓰기)
						// 파일명 중복처리
						// 사용자가 업로드한 파일이름
						String filename = file.getOriginalFilename();
						// test.txt ->test_1.txt 로 저장되게 할 것
						String onlyFilename = filename.substring(0, filename.lastIndexOf("."));// 서브스트링이 잘라내는건데 라스트인덱스 뒤에서부터 "."
																								// 바로 앞까지 부등호 생각하면 됨
						String extention = filename.substring(filename.lastIndexOf("."));// 매개변수가 filename.lastIndexOf(".") 하나
																							// 이므로, "."부터 끝까지
						// 실제 업로드 할 파일명을 저장할 변수
						String filepath = null; // fundingFilepath로 변수 변경해서 사용해야하려나?
						int count = 0;
						while (true) {// 숫자를 붙이더라도 더이상 중복이 안될떄까지 하려고 무한 반복
							if (count == 0) {
								// 반복 첫번쨰 회차에는 원본 파일명을 그대로 적용
								filepath = onlyFilename + extention;// test.txt
							} else {
								filepath = onlyFilename + "_" + count + extention;
							}
							File checkFile = new File(savePath + filepath);// 파일하나 만들어보는거 File java.io 클래스
							if (!checkFile.exists()) {// 만약에 이 파이링름이 존재하면 true 아니면 false
								break;
							}
							count++;
						}

						// 파일명 중복검사가 끝난 시점

						try {
							FileOutputStream fos = new FileOutputStream(new File(savePath + filepath));
							// 업로드 속도증가를 위한 보조스트림 생성
							BufferedOutputStream bos = new BufferedOutputStream(fos);
							// 파일업로드
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
						// 서버 파일 업로드 끝(파일1개단위) 여기까지가 멀티파티리퀘스트 객체만든거 수작업으로 진행한 것.
						///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
						// 이제 위에서만든 리스트를 이용해서 DB에 넣는작업
						FundingFile fundingFilePath = new FundingFile();	
						fundingFilePath.setFundingFilePath(filepath);
						fundingList.add(fundingFilePath);
						

					}
				}
				int result = service.updateFunding(f,fop,fundingList,deleteFundingFileNo);
				System.out.println("최종 update result 값 : "+result);
				if(deleteFundingFileNo!=null) {
					if(result == upfile.length+deleteFundingFileNo.length) {
						model.addAttribute("icon", "success");
						model.addAttribute("title", "펀딩수정 완료");
						model.addAttribute("msg", "펀딩수정이 완료되었습니다!");
						model.addAttribute("loc", "/manageFunding.kh");
					}else {			
						model.addAttribute("icon", "error");
						model.addAttribute("title", "펀딩수정 실패");
						model.addAttribute("msg", "펀딩 수정에 실패했습니다! 다시한번 확인해주세요.");
						model.addAttribute("loc", "/manageFunding.kh");
					}
				}else {
					if(result == upfile.length) {
						model.addAttribute("icon", "success");
						model.addAttribute("title", "펀딩수정 완료");
						model.addAttribute("msg", "펀딩수정이 완료되었습니다!");
						model.addAttribute("loc", "/manageFunding.kh");
					}else {			
						model.addAttribute("icon", "error");
						model.addAttribute("title", "펀딩수정 실패");
						model.addAttribute("msg", "펀딩 수정에 실패했습니다! 다시한번 확인해주세요.");
						model.addAttribute("loc", "/manageFunding.kh");
					}
				}
				return "common/msg";
				
	}
	

	@ResponseBody
	@RequestMapping(value="/fundingInsertSummernote.kh", produces = "application/text; charset=utf-8")
	public String FundingInsertSummernote(@RequestParam("file") MultipartFile[] file, HttpServletRequest request ) {
		String filepath = null;
		
		if(!file[0].isEmpty()) {
			// 사진이 있을때만 로직 실행
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/funding/");
			
			MultipartFile onefile = file[0];
			
			filepath = fileIo(onefile, savePath);
		}
		//return "../../../resources/upload/funding/"+filepath;
		return "/resources/upload/funding/"+filepath;
	}
	@ResponseBody
	@RequestMapping(value="/addLikeF.kh")//미구현
	public String addLike(@SessionAttribute(required=false) Member m, String fundingNo) {
		int result = service.addLike(m.getMemberNo(), Integer.parseInt(fundingNo));
		
		return Integer.toString(result);
	}

	@ResponseBody
	@RequestMapping(value="/removeLikeF.kh")//미구현
	public String removeLike(@SessionAttribute(required=false) Member m, int fundingNo) {
		int result = service.removeLike(m.getMemberNo(), fundingNo);
		
		return Integer.toString(result);
	}
	
	
	@ResponseBody //미구현
	@RequestMapping(value="/addCommentF.kh", produces="application/json; charset=utf-8")
	public String AddCommentF(@SessionAttribute(required=false) Member m,Comment c) {
		System.out.println(c.getCommentContent());
		System.out.println(c.getProjectNo());
		c.setMemberNo(m.getMemberNo());
		c = service.addComment(c);
		if(c==null) {
			return "error";
		}else {
			return new Gson().toJson(c);
		}
	}
	///결제
	@RequestMapping(value="/fundingOrder.kh")//미구현 테스트용
	public String FundingPayment(PaymentData pd,@SessionAttribute(required=false) Member m,Model model) {
		System.out.println("=======옵션 페이먼트데이터=====");
		System.out.println("펀디이름"+pd.getFundingName());
		System.out.println("펀딩번호"+pd.getFundingNo());
		System.out.println("펀딩판매자번호"+pd.getMemberNo());
		for(int i = 0 ; i<pd.getAmountNumPrice().length;i++) {
			System.out.println("각각개수-가격 : "+pd.getAmountNum()[i]+"|"+pd.getAmountNumPrice()[i]+"|"+pd.getOptionNameList()[i]);
		}
		ArrayList<PaymentData> list = new ArrayList<PaymentData>();
		int totalPrice = 0;
		for(int i = 0 ; i<pd.getAmountNumPrice().length;i++) {
			PaymentData pd1 = new PaymentData();
			pd1.setFundingName(pd.getFundingName());
			pd1.setFundingNo(pd.getFundingNo());
			pd1.setMemberNo(pd.getMemberNo());
			pd1.setAmountNum2(pd.getAmountNum()[i]);
			pd1.setAmountNumPrice2(pd.getAmountNumPrice()[i]);
			pd1.setOptionNameList2(pd.getOptionNameList()[i]);
			pd1.setOptionPriceNo2(pd.getOptionPriceNo()[i]);
			totalPrice = totalPrice+pd.getAmountNum()[i]*pd.getAmountNumPrice()[i];
			System.out.println("토탈가격"+totalPrice);

			list.add(pd1);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("tp",totalPrice);
		return "funding/fundingOrder";
	}
	
	@RequestMapping(value="/fundingPay.kh")
	public String FundingPay(Order o ,OrderProduct op,Model model,@SessionAttribute(required=false) Member m ) {
		System.out.println("--------주문상세-----------");
		System.out.println(o.getOrderPoint());
		System.out.println(o.getOrderPrice());
		System.out.println(o.getOrderDelName());
		System.out.println(o.getOrderDelPhone());
		System.out.println(o.getOrderDelPost());
		System.out.println(o.getOrderDelAddr1());
		System.out.println(o.getOrderDelAddr2());
		System.out.println(o.getOrderDelAsk());
		System.out.println("프로젝트네임!!!!! : "+o.getProjectName());
		System.out.println("세션번호 : "+m.getMemberNo());	
		System.out.println(o.getProjectNo());
		System.out.println("셀러번호 "+o.getSellerNo());
		o.setMemberNo(m.getMemberNo());
		o.setProjectName(o.getProjectName2()[0]);
		int result = service.insertOrder(o,op);
		System.out.println("인서트결과 서공? : "+result);
		for(int i = 0 ; i<op.getProductPrice2().length;i++) {
			System.out.println(op.getProductAmount2()[i]);
			System.out.println(op.getProductPrice2()[i]);
			System.out.println(op.getOptionNo2()[i]);
		}
		
		
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
	
	
	/*
	 * @RequestMapping(value="//") public String addOrder(Model model) { // 이 단계에서
	 * 주문내역 불러오기 - 보통은 여기서 각자의 프로젝트를 불러온다 int result = dao.insertOneOrder();
	 * 
	 * model.addAttribute("order", order); return "auction/addOrder"; }
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 옵션 꺼내오기 위한 스트링 토크나이저 메소드
	/*
	 * public HashMap<Integer, HashMap<Integer, String>> tokenizerTest(String
	 * fundingOptionName,String fundingOptionValue) { //StringTokenizer sT1 = new
	 * StringTokenizer(fundingOptionName,","); StringTokenizer sT2 = new
	 * StringTokenizer(fundingOptionValue,","); //HashMap<Integer, String>
	 * optionName = new HashMap<Integer, String>(); HashMap<Integer, String>
	 * optionValue = new HashMap<Integer, String>(); //int index1 = 0; int index2 =
	 * 0;
	 * 
	 * while(sT1.hasMoreTokens()) { optionName.put(index1,sT1.nextToken());
	 * index1++; }
	 * 
	 * while(sT2.hasMoreTokens()) { optionValue.put(index2,sT2.nextToken());
	 * index2++; } HashMap<Integer, HashMap<Integer, String>> map = new
	 * HashMap<Integer, HashMap<Integer, String>>(); //map.put(0,optionName);
	 * map.put(1, optionValue); return map; }
	 */
	
	//토크나이저 함수
	public ArrayList<String> tokenizer(String fundingOptionValue){
		StringTokenizer sT = new StringTokenizer(fundingOptionValue,"/");
		ArrayList<String> optionValue = new ArrayList<String>();
		while(sT.hasMoreTokens()) {
			optionValue.add(sT.nextToken());
		}
		return optionValue;
	}
	
	public ArrayList<String> plusList(ArrayList<String> list1, ArrayList<String> list2){
		ArrayList<String> result = new ArrayList<String>(); //합친 결과를 답는 어레이배열
		for(String value1 : list1) { // list1이라고 리스트 value에서 어레이에서 하나씩 꺼내서 string으로 value로 넣어줌
			for(String value2 : list2) {
				String str =value1;
				str += " - ";
				str += value2;
				result.add(str);
			}
		}
		return result; //어레이로 리턴
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
	

}

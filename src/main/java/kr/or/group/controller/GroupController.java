package kr.or.group.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import kr.or.group.model.service.GroupService;
import kr.or.group.model.vo.Group;
import kr.or.member.model.vo.Member;

@Controller
public class GroupController {
	@Autowired
	private GroupService service;
	
	//메인
	@RequestMapping(value="/groupList.kh")
	public String groupList() {
		return "group/groupMain";
	}
	
	//다섯 카테고리
	@RequestMapping(value="/groupTech.kh")
	public String groupTech() {
		return "group/groupTech";
	}
	@RequestMapping(value="/groupFashion.kh")
	public String groupFashion() {
		return "group/groupFashion";
	}
	@RequestMapping(value="/groupLiving.kh")
	public String groupLiving() {
		return "group/groupLiving";
	}
	@RequestMapping(value="/groupFood.kh")
	public String groupFood() {
		return "group/groupFood";
	}
	@RequestMapping(value="/groupBeauty.kh")
	public String groupBeauty() {
		return "group/groupBeauty";
	}
	
	//상세페이지
	@RequestMapping(value="/groupView.kh")
	public String groupView() {
		return "group/groupView";
	}
	
	//공동구매 등록
	@RequestMapping(value="/groupAdd.kh")
	public String groupAdd() {
		return "group/groupAdd";
	}
	
	@RequestMapping(value="/groupAdd2.kh")
	public String groupAdd2() {
		return "group/groupAdd2";
	}
	

	@RequestMapping(value="/insertGroup.kh")
	public String insertGroup(@SessionAttribute(required=false) Member m, Group group, MultipartFile[] grpFilepath, HttpServletRequest request, RedirectAttributes redirect) {
		String filepath = null;
		group.setMemberNo(m.getMemberNo());
		
		if(!grpFilepath[0].isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/auction/");
			
			MultipartFile file = grpFilepath[0];
			
			filepath = fileIo(file, savePath);
		}else {
			filepath = "preview.jpg";
		}
		group.setGrpFilepath(filepath);
		int result = service.insertGroup(group);
		
		if(result>0) {
			return "group/groupMain";	 
		}else {			
			return "redirect:/addGroup2.kh";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/groupImgUpload.kh")
	public String groupImgUpload(@RequestParam("file") MultipartFile[] file, HttpServletRequest request ) {
		String filepath = null;
		
		if(!file[0].isEmpty()) {
			// 사진이 있을때만 로직 실행
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/group/");
			
			MultipartFile onefile = file[0];
			
			filepath = fileIo(onefile, savePath);
		}
		return "../../../resources/upload/group/"+filepath;
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

package com.douzonemania.scs.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.repository.DesignRepository;
import com.douzonemania.scs.vo.ceo.MainMenuVo;

@Service
public class DesignService {

	@Autowired
	DesignRepository designRepository;
	
//	private static final String SAVE_PATH = "/scs-uploads";
	private static final String SAVE_PATH = "C:\\Users\\Bit\\git\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	//private static final String SAVE_PATH = "D:\\douzone2020\\eclipse-workspace\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	private static final String URL = "/assets/images/scs-uploads";
	

	public boolean insertMainMenu(String id, MainMenuVo vo) {
		MainMenuVo mainMenuVo = new MainMenuVo();
		
		String menu = vo.getFirst() + ":" + vo.getSecond() + ":" + vo.getThird()
				+ ":" + vo.getFourth() + ":" + vo.getFifth();
		String menuList[] = menu.split(":");

		int listCount = 0;
		for(int i = 0; i < menuList.length; i++) {
			if(!menuList[i].equals("")) {
				if(listCount == 0) {
					mainMenuVo.setFirst(menuList[i]);
					listCount++;
				} else if(listCount == 1) {
					mainMenuVo.setSecond(menuList[i]);
					listCount++;
				} else if(listCount == 2) {
					mainMenuVo.setThird(menuList[i]);
					listCount++;
				} else if(listCount == 3) {
					mainMenuVo.setFourth(menuList[i]);
					listCount++;
				} else if(listCount == 4){
					mainMenuVo.setFifth(menuList[i]);
				}
			}
		}
		mainMenuVo.setId(id);
		
		// design insert or update 판별
		// insert
		if(designRepository.checkInsertOrUpdate(id) == null) {
			int count = designRepository.insertMainMenu(id, mainMenuVo);
			return count == 1;
			
		} else {		// insert를 한 경우(update 해줘야함)
			int count = designRepository.updateMainMenu(id, mainMenuVo);
			return count == 1;
		}
	}

	public MainMenuVo getMainMenuList(String id) {
		MainMenuVo vo = designRepository.getMainMenuList(id);
		
		JSONObject obj = new JSONObject();
		
		obj.put("first", vo.getFirst());
		obj.put("second",vo.getSecond());
		obj.put("third", vo.getThird());
		obj.put("fourth", vo.getFourth());
		obj.put("fifth", vo.getFifth());
		
		return vo;
	}	
	
	public String restore(MultipartFile excelFile) {
		String url = "";
		try {
			if (excelFile.isEmpty()) {
				return url;
			}
			String originFilename = excelFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf('.') + 1);
			String saveFilename = generateSaveFilename(originFilename, extName);
			System.out.println(saveFilename);
			long fileSize = excelFile.getSize();
			byte[] fileData = excelFile.getBytes();
			
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
			os.write(fileData);
			os.close();
			
			url = URL + "/" + saveFilename;
			
			
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
		return url;
	}
	
	private String generateSaveFilename(String originFileName, String extName) {
		String filename = "";
		Calendar calendar = Calendar.getInstance();
		filename += calendar.get(Calendar.YEAR);
		filename += calendar.get(Calendar.MONTH);
		filename += calendar.get(Calendar.DATE);
		filename += calendar.get(Calendar.HOUR);
		filename += calendar.get(Calendar.MINUTE);
		filename += calendar.get(Calendar.SECOND);
		filename += calendar.get(Calendar.MILLISECOND);
		//filename += ("." + originFileName);
		filename += ("." + extName);
		return filename;
	}
	
}

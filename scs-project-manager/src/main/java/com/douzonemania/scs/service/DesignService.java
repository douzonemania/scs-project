package com.douzonemania.scs.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.repository.DesignRepository;
import com.douzonemania.scs.vo.ceo.CustomDesignVo;
import com.douzonemania.scs.vo.ceo.MainMenuVo;
import com.douzonemania.scs.vo.ceo.SubMenuVo;

@Service
public class DesignService {

	@Autowired
	DesignRepository designRepository;
	
//	private static final String SAVE_PATH = "/scs-uploads";
	private static final String SAVE_PATH = "C:\\Users\\R35\\git\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
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

	public Boolean insertCustomMenu(int menuIndex, String name, String id) {
		int count = designRepository.insertCustomMenu(menuIndex, name, id);
		return count == 1;
	}

	public List<SubMenuVo> getSubMenuById(String id) {
		return designRepository.getSubMenuById(id);
	}

	public int getMaxSubMenuIndex(String id) {
		return designRepository.getMaxSubMenuIndex(id);
	}
	
	public void setDesign(String map,String id) {
		
		
		System.out.println(map);
		
		JSONObject jObject = new JSONObject(map);
		JSONArray jArray = jObject.getJSONArray("form");
		
		int index =jObject.getInt("index");
		
		int submenuNum = designRepository.findSubmenuNum(index,id);
		System.out.println("SUBMENUINDEX : "+submenuNum);
		
		
		for(int i=0;i<jArray.length()-1;i++) {
			//파싱
			JSONObject obj =jArray.getJSONObject(i);
			
			CustomDesignVo vo = new CustomDesignVo();
			
			vo.setCustomIndex(obj.getInt("id"));
			vo.setDesignID(obj.getString("element"));
			
			
			JSONObject elementData = obj.getJSONObject("elementData");
			
			int check = designRepository.findCustoms(vo,submenuNum);
			
			if(check ==0) {
				check = designRepository.insertCustoms(vo,submenuNum);
			}else {
				//update
				designRepository.updateCustoms(vo,submenuNum);
			}
	
			for(int j=1;j<=elementData.length();j++) {
				int result = designRepository.findContents(check,j);
				
				if(result==0) {
					designRepository.insertContents(j,elementData.get(j+"").toString(),check);
				}else {
					designRepository.updateContents(j,elementData.get(j+"").toString(),check);
				}
				
			}
		}
	}
	
}

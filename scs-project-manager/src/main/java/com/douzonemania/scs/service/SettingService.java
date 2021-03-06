package com.douzonemania.scs.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.repository.SettingRepository;
import com.douzonemania.scs.vo.ceo.AgreementVo;
import com.douzonemania.scs.vo.ceo.CeoVo;
import com.douzonemania.scs.vo.ceo.ShipCompanyVo;

@Service
public class SettingService {
	private static final String SAVE_PATH = "/scs-uploads";
	private static final String URL = "/assets/scs-manager/images";
	
	@Autowired
	private SettingRepository settingRepository;
	
	/* setting-basic update */
	public int updateCeo(CeoVo ceoVo) {
		return settingRepository.updateCeo(ceoVo);
	}
	
	/* setting-basic 배송사 가져오기 */
	public List<ShipCompanyVo> getShipList(String id) {
		List<ShipCompanyVo> list = settingRepository.getList(id);
		return list;
	}

	/* setting-basic 배송사 추가 */
	public int insertShip(ShipCompanyVo shipCompanyVo) {
		
		return settingRepository.insertShip(shipCompanyVo);
		
	}

	/* setting-basic 배송사 count */
	public int shipCount(String id) {
		//	id처리

		return settingRepository.shipCount(id);

	}

	/* setting-basic 배송사 삭제 */
	public boolean deleteShip(Long no) {
		return settingRepository.deleteShip(no) == 1;
	}
	/* setting-basic 파일 업로드 시작 */
	public String restore(CeoVo ceoVo, MultipartFile multipartFile) {
		String url = "";
		try {
			if (multipartFile.isEmpty()) {
				return url;
			}
			
			String originFilename = multipartFile.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf('.') + 1);

			String saveFilename = generateSaveFilename(extName);
			long fileSize = multipartFile.getSize();


			byte[] fileData = multipartFile.getBytes();
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
			
			os.write(fileData);
			os.close();
			url = URL + "/" + saveFilename;
			
			
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
	
		return url;
	}
	/* setting-basic 파일 업로드 시작 */
	public String restore(CeoVo ceoVo, MultipartFile multipartFile, String src) {
		String url = "";
		try {
			if(src != null && multipartFile.isEmpty()) {
				url = src;
				
				return url;
			}else if (multipartFile.isEmpty()) {
				return url;
			}else {
				String originFilename = multipartFile.getOriginalFilename();
				String extName = originFilename.substring(originFilename.lastIndexOf('.') + 1);
	
				String saveFilename = generateSaveFilename(extName);
				long fileSize = multipartFile.getSize();
	
			
				byte[] fileData = multipartFile.getBytes();
				OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
				
				os.write(fileData);
				os.close();
				url = URL + "/" + saveFilename;
			}
			
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
		
		return url;
	}
	/* file 이름변환 */
	private String generateSaveFilename(String extName) {
		String filename = "";

		Calendar calendar = Calendar.getInstance();
		filename += calendar.get(Calendar.YEAR);
		filename += calendar.get(Calendar.MONTH);
		filename += calendar.get(Calendar.DATE);
		filename += calendar.get(Calendar.HOUR);
		filename += calendar.get(Calendar.MINUTE);
		filename += calendar.get(Calendar.SECOND);
		filename += calendar.get(Calendar.MILLISECOND);
		filename += ("." + extName);

		return filename;
	}

	/* setting-policy 약관 찾기 */
	public AgreementVo findAgreementById(String id) {
		
		return settingRepository.findAgreementById(id);
	}
	
	public int insertPolicy(String id) {
		return settingRepository.insertPolicy(id);
	}

	/* setting-policy 약관 업데이트 */
	public int updatePolicy(String jsonData, String id) {
		
		JSONObject jObject = new JSONObject(jsonData);

		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";
		
		String agreement = jObject.getString("agreement");
		
		for(int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
		
			if(i == jArray.length() - 1) {
				contents += obj;
			}
			else {
				contents += obj + ",";
			}
		}

		return settingRepository.updatePolicy(contents,agreement, id);
		
	}



}

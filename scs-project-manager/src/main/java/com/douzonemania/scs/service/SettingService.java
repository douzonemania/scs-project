package com.douzonemania.scs.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.douzonemania.scs.repository.SettingRepository;
import com.douzonemania.scs.vo.ceo.CeoVo;

@Service
public class SettingService {
	private static final String SAVE_PATH = "C:\\Users\\bit-user\\git\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	private static final String URL = "/assets/images/scs-uploads";
	
	@Autowired
	private SettingRepository settingRepository;
	
	
	// ceo 업로드
	public int updateCeo(CeoVo ceoVo) {
		return settingRepository.updateCeo(ceoVo);
	}
	
	
	// 파일 업로드
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

			System.out.println("######### " + originFilename);
			System.out.println("######### " + saveFilename);
			System.out.println("######### " + fileSize);

			byte[] fileData = multipartFile.getBytes();
			OutputStream os = new FileOutputStream(SAVE_PATH + "/" + saveFilename);
			os.write(fileData);
			os.close();
			url = URL + "/" + saveFilename;
			
		} catch (IOException ex) {
			throw new RuntimeException("file upload error:" + ex);
		}
		System.out.println("url:" + url);
		return url;
	}

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
}

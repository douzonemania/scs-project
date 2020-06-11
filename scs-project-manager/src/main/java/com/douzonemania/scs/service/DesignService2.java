package com.douzonemania.scs.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class DesignService2 {
//	private static final String SAVE_PATH = "/scs-uploads";
	private static final String SAVE_PATH = "C:\\Users\\R35\\git\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	//private static final String SAVE_PATH = "D:\\douzone2020\\eclipse-workspace\\scs-project\\scs-project-manager\\src\\main\\webapp\\assets\\images\\scs-uploads";
	private static final String URL = "/assets/images/scs-uploads";
	
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

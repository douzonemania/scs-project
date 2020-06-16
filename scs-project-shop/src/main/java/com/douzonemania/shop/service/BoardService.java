package com.douzonemania.shop.service;


import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.BoardRepository;

@Service
public class BoardService {

	@Autowired
	private BoardRepository boardRepository;
	
	// json data를 파싱하여 qna 전송
	public boolean writeQna(String jsonData, String option, String id, String db) {
		JSONObject jObject = new JSONObject(jsonData);

		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";

		for(int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			contents += obj.getString("insert");
		}

		String title = jObject.getString("title");

		// 메일 발송
		boolean result = boardRepository.writeQna(title, contents, option, id, db);

		return result;
	}

	
	
}

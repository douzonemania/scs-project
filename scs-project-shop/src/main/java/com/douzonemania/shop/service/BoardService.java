package com.douzonemania.shop.service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import java.util.zip.GZIPOutputStream;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.BoardRepository;
import com.douzonemania.shop.vo.BoardVo;
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.ItemReplyVo;
import com.douzonemania.shop.vo.ReplyVo;

@Service
public class BoardService {

	// 페이징 크기 결정
	private static final int LIST_SIZE = 5;
	private static final int PAGE_SIZE = 5;

	@Autowired
	private BoardRepository boardRepository;

	// json data를 파싱하여 qna 전송
	public boolean writeQna(String jsonData, Long no, String db) throws IOException {
		JSONObject jObject = new JSONObject(jsonData);

		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";

		for (int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			if (i == jArray.length() - 1) {
				contents += obj;
			} else {
				contents += obj + ",";
			}
		}

		String option = jObject.getString("option");
		String title = jObject.getString("title");
		byte[] b = compressToByte(contents);
		
		boolean result = boardRepository.writeQna(title, b, option, no, db);

		return result;
	}

	// qna board list 페이징
	public Map<String, Object> getQNAList(String db, int currentPage, String key, String option) {
		Map<String, Object> map = new HashMap<>();

		// keyword 지정
		String keywordList[] = key.split(",");
		String keyword = "";
		if (keywordList.length == 2) {
			if (option.equals("category")) {
				keyword = keywordList[1];
			} else {
				keyword = keywordList[0];
			}
		} else {
			keyword = key;
		}

		// start index 결정
		int offset = (currentPage - 1) * 5;

		int total = boardRepository.listCount(db, option, keyword);

		List<BoardVo> list;
		if (option.equals("")) {
			list = boardRepository.boardList(db, offset, LIST_SIZE);
		} else {
			list = boardRepository.searchBoardList(db, option, keyword, offset, LIST_SIZE);
		}

		int pageCnt = (total % LIST_SIZE != 0) ? (total / LIST_SIZE) + 1 : (total / LIST_SIZE);
		int calCnt = (currentPage % 5) == 0 ? currentPage - 1 : currentPage;

		int beginPage = calCnt - (calCnt % 5) == 0 ? 1 : calCnt - (calCnt % 5) + 1;
		int prevPage = beginPage == 1 ? 1 : beginPage - 1;
		int endPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : (beginPage + PAGE_SIZE) - 1;
		int nextPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : endPage + 1;

		if (nextPage >= pageCnt)
			nextPage = pageCnt;
		if (endPage >= pageCnt)
			endPage = pageCnt;

		map.put("list", list);
		map.put("beginPage", beginPage);
		map.put("prevPage", prevPage);
		map.put("endPage", endPage);
		map.put("nextPage", nextPage);
		map.put("page", currentPage);
		map.put("total", total);
		map.put("option", option);
		map.put("kwd", keyword);
		map.put("calCnt", calCnt);

		if (endPage != pageCnt)
			map.put("listsize", LIST_SIZE);
		else {
			if (endPage % 5 == 0) {
				map.put("listsize", 5);
			} else {
				map.put("listsize", endPage % 5);
			}
		}

		return map;
	}

	public BoardVo findBoardByNo(String id, int no) throws IOException {
		BoardVo vo = boardRepository.findBoardByNo(id, no);
		
		byte[] b = vo.getContents();

		vo.setContents1(unCompressString(b));
		
		return vo;
	}

	public String findNameByNo(String id, int no) {
		return boardRepository.findNameByNo(id, no);
	}

	public ReplyVo findReplyByParentsNo(String id, int no) throws IOException {

		ReplyVo vo = boardRepository.findReplyByParentsNo(id, no);
		
		byte[] b = vo.getContents();

		vo.setContents1(unCompressString(b));
		
		return vo;
	}

	public boolean deleteBoard(String id, int no) {
		int count = boardRepository.deleteBoard(id, no);
		return count == 1;
	}

	//////////////////////////////// end qna
	//////////////////////////////// board////////////////////////////////////

	// json data를 파싱하여 qna 전송
	public boolean writeItemBoard(String jsonData, Long memberNo, int itemNo, String db) throws IOException {
		JSONObject jObject = new JSONObject(jsonData);

		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";

		for (int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			if (i == jArray.length() - 1) {
				contents += obj;
			} else {
				contents += obj + ",";
			}
		}
		String title = jObject.getString("title");
		byte[] b = compressToByte(contents);

		boolean result = boardRepository.writeItemBoard(title, b, memberNo, itemNo, db);

		return result;
	}

	public Map<String, Object> getItemBoardList(String id, int currentPage, String keyword, String option) {

		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset = (currentPage - 1) * 5;

		int total = boardRepository.itemBoardListCount(id, option, keyword);

		List<ItemBoardVo> list;
		if (option.equals("")) {
			list = boardRepository.itemBoardList(id, offset, LIST_SIZE);
		} else {
			list = boardRepository.searchItemBoardList(id, option, keyword, offset, LIST_SIZE);
		}

		int pageCnt = (total % LIST_SIZE != 0) ? (total / LIST_SIZE) + 1 : (total / LIST_SIZE);
		int calCnt = (currentPage % 5) == 0 ? currentPage - 1 : currentPage;

		int beginPage = calCnt - (calCnt % 5) == 0 ? 1 : calCnt - (calCnt % 5) + 1;
		int prevPage = beginPage == 1 ? 1 : beginPage - 1;
		int endPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : (beginPage + PAGE_SIZE) - 1;
		int nextPage = (pageCnt - (pageCnt % 5)) == (calCnt - (calCnt % 5)) ? pageCnt : endPage + 1;

		if (nextPage >= pageCnt)
			nextPage = pageCnt;
		if (endPage >= pageCnt)
			endPage = pageCnt;

		map.put("list", list);
		map.put("beginPage", beginPage);
		map.put("prevPage", prevPage);
		map.put("endPage", endPage);
		map.put("nextPage", nextPage);
		map.put("page", currentPage);
		map.put("total", total);
		map.put("option", option);
		map.put("kwd", keyword);
		map.put("calCnt", calCnt);

		if (endPage != pageCnt)
			map.put("listsize", LIST_SIZE);
		else {
			if (endPage % 5 == 0) {
				map.put("listsize", 5);
			} else {
				map.put("listsize", endPage % 5);
			}
		}

		return map;
	}

	public ItemBoardVo findItemBoardByNo(String id, int no) throws IOException {
		ItemBoardVo vo = boardRepository.findItemBoardByNo(id, no);
		
		byte[] b = vo.getContents();

		vo.setContents1(unCompressString(b));
		
		return vo;
	}

	public ItemReplyVo findItemReplyByParentsNo(String id, int no) throws IOException {
		ItemReplyVo vo = boardRepository.findItemReplyByParentsNo(id, no);
		
		byte[] b = vo.getContents();

		vo.setContents1(unCompressString(b));
		
		return vo;
	}

	public boolean deleteItemBoard(String id, int no) {
		int count = boardRepository.deleteItemBoard(id, no);
		return count == 1;
	}

//////////////////////////////////에디터 byte[] 압축////////////////////////////////////
	public static byte[] compressToByte(final String data) throws IOException {
		if (data == null || data.length() == 0) {
			return null;
		} else {
			byte[] bytes = data.getBytes("UTF-8");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			GZIPOutputStream os = new GZIPOutputStream(baos);
			os.write(bytes, 0, bytes.length);
			os.close();
			byte[] result = baos.toByteArray();
			return result;
		}
	}

	public static String unCompressString(final byte[] data) throws IOException {
		if (data == null || data.length == 0) {
			return null;
		} else {
			ByteArrayInputStream bais = new ByteArrayInputStream(data);
			ByteArrayOutputStream buffer = new ByteArrayOutputStream();
			GZIPInputStream is = new GZIPInputStream(bais);
			byte[] tmp = new byte[256];
			while (true) {
				int r = is.read(tmp);
				if (r < 0) {
					break;
				}
				buffer.write(tmp, 0, r);
			}
			is.close();

			byte[] content = buffer.toByteArray();
			return new String(content, 0, content.length, "UTF-8");
		}
	}
////////////////////////////////////////////////////////////////////

}

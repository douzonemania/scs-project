package com.douzonemania.shop.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.douzonemania.shop.vo.BoardVo;
import com.douzonemania.shop.vo.ItemBoardVo;
import com.douzonemania.shop.vo.ItemReplyVo;
import com.douzonemania.shop.vo.ReplyVo;

@Repository
public class BoardRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public String getSession() {
		ServletRequestAttributes attr = (ServletRequestAttributes)RequestContextHolder.currentRequestAttributes();
		
		HttpSession nowSession = attr.getRequest().getSession();
		
		String id =nowSession.getAttribute("name").toString();
		
		
		return id;
	}

	public int listCount(String db, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", db);
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("board.listCount", map); 
	}

	public List<BoardVo> boardList(String db, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", db);
		map.put("offset", offset);
		map.put("size", size);

		return sqlSession.selectList("board.boardList", map);
	}

	public List<BoardVo> searchBoardList(String db, String option, String keyword, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", db);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("board.searchBoardList", map);
	}

	// qna 글 insert
	public boolean writeQna(String title, String contents, String option, Long no, String db) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("option", option);
		map.put("no", no);
		map.put("db", db);
		return sqlSession.insert("board.writeQna", map) == 1;
	}

	// 글 번호로 board에 대한 정보를 가져옴
		public BoardVo findBoardByNo(String id, int no) {
			Map<String, Object> map = new HashMap<>();
			map.put("db", id);
			map.put("no", no);
			
			return sqlSession.selectOne("board.findBoardByNo", map);
		}

	public String findNameByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("board.findNameByNo", map);
	}

	// board 글에 남긴 답글에 대한 정보를 가져옴
	public ReplyVo findReplyByParentsNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("board.findReplyByParentsNo", map);
	}
	
	public int deleteBoard(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		BoardVo boardVo = sqlSession.selectOne("board.findBoardByNo", map);
		
		// 답글이 달려있으면 글을 지우지 못하도록.
		if(!boardVo.isReplyState()) {
			return sqlSession.delete("board.deleteBoard", map);
		}
		else {
			return 0; 
		}
	}
	
////////////////////////////////end qna board////////////////////////////////////	

	public boolean writeItemBoard(String title, String contents, Long memberNo, int itemNo, String db) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("title", title);
		map.put("contents", contents);
		map.put("memberNo", memberNo);
		map.put("itemNo", itemNo);
		map.put("db", db);

		return sqlSession.insert("board.insertItemBoard", map) == 1;
	}

	public int itemBoardListCount(String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("option", option);
		map.put("keyword", keyword);

		return sqlSession.selectOne("board.itemBoardListCount", map);
	}

	public List<BoardVo> itemBoardList(String id, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("offset", offset);
		map.put("size", size);

		return sqlSession.selectList("board.itemBoardList", map);
	}

	public List<BoardVo> searchItemBoaardList(String id, String option, String keyword, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db",id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);

		return sqlSession.selectList("board.searchItemBoardList", map);
	}

	// board 글에 남긴 답글에 대한 정보를 가져옴
	public ItemBoardVo findItemBoardByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("board.findItemBoardByNo", map);
	}
	
	public ItemReplyVo findItemReplyByParentsNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("board.findItemReplyByParentsNo", map);
	}

	public int deleteItemBoard(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		ItemBoardVo itemBoardVo = sqlSession.selectOne("board.findItemBoardByNo", map);
		
		// 답글이 달려있으면 글을 지우지 못하도록.
		if(!itemBoardVo.isReplyState()) {
			return sqlSession.delete("board.deleteItemBoard", map);
		}
		else {
			return 0; 
		}
	}
}

package com.douzonemania.scs.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.douzonemania.scs.vo.member.BoardVo;
import com.douzonemania.scs.vo.member.MemberVo;
import com.douzonemania.scs.vo.member.ReplyVo;

@Repository
public class MemberRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public String getMemberEmail(String id, int no) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		return sqlSession.selectOne("member.getMemberEmail", map);
	}
	
	public List<MemberVo> memberList(String id, int offset, int size) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("member.memberList", map);
	}

	public List<MemberVo> searchMemberList(String id, String option, String keyword
									, int offset, int size) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("member.searchMemberList", map);

	}
	
	public int listCount(String id, String option, String keyword) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("member.listCount", map); 
	}
	
	//////////////////////////////////////////////////////////////////
	
	public List<BoardVo> boardList(String id, int offset, int size) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("member.findBoardList", map);
	}
	
	public List<BoardVo> searchBoardList(String id, String option, String keyword
			, int offset, int size) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		map.put("offset", offset);
		map.put("size", size);
		
		return sqlSession.selectList("member.findSearchBoardList", map);
	}
	
	public int boardListCount(String id, String option, String keyword) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("option", option);
		map.put("keyword", keyword);
		
		return sqlSession.selectOne("member.boardListCount", map); 
	}

	public int deleteMember(String id, int no) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.update("member.deleteMember", map);
	}

	public int deleteBoard(String id, int no) {

		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		BoardVo boardVo = sqlSession.selectOne("member.findBoardByNo", map);
		
		// 답글이 달려있으면 글을 지우지 못하도록.
		if(!boardVo.isReplyState()) {
			return sqlSession.delete("member.deleteBoard", map);
		}
		else {
			return 0; 
		}
	}

	// board의 no(parentsNo)에 대한 답글을 insert
	public int boardReply(String id, int parentsNo, String contents) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("parentsNo", parentsNo);
		map.put("contents", contents);
		
		return sqlSession.insert("member.insertBoardReply", map);
	}

	// 글 번호로 board에 대한 정보를 가져옴
	public BoardVo findBoardByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("member.findBoardByNo", map);
	}
	
	// board 글에 남긴 답글에 대한 정보를 가져옴
	public ReplyVo findReplyByParentsNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("member.findReplyByParentsNo", map);
	}

	// board 답글을 남겼으면 답글 상태를 true로 변경, 답글을 삭제했으면 상태를 false로 변경
	public int updateBoardReply(String id, int no, boolean state) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		map.put("state", state);
		
		return sqlSession.update("member.updateBoardReply", map);
	}

	// 회원 이름을 가져오기 위함
	public String findNameByNo(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.selectOne("member.findNameByNo", map);
	}

	public int deleteBoardReply(String id, int no) {
		Map<String, Object> map = new HashMap<>();
		map.put("db", id);
		map.put("no", no);
		
		return sqlSession.delete("member.deleteBoardReply", map);
	}


}
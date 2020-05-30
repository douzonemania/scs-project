package com.douzonemania.scs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.MemberRepository;
import com.douzonemania.scs.vo.member.BoardVo;
import com.douzonemania.scs.vo.member.MemberVo;
import com.douzonemania.scs.vo.member.ReplyVo;

@Service
public class MemberService {

	// 송신자 이메일 주소, 패스워드
	final static String user = "sjy80333@gmail.com";
	final static String password = "vmjxszqyzgnugerp";

	// 페이징 크기 결정
	private static final int LIST_SIZE =5;
	private static final int PAGE_SIZE =5;

	@Autowired
	private MemberRepository memberRepository;

	// 받는사람 이메일 주소와 메일 제목, 내용을 input에서 받아오기
	public boolean gmailSend(String email, String title, String contents) {

		Properties prop = new Properties(); 
		prop.put("mail.smtp.host", "smtp.gmail.com"); 
		prop.put("mail.smtp.port", 465); 
		prop.put("mail.smtp.auth", "true"); 
		prop.put("mail.smtp.ssl.enable", "true"); 
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");

		Session session = Session.getInstance(prop, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}

		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));

			//수신자메일주소
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 

			// Subject
			message.setSubject(title); //메일 제목을 입력

			// Text
			message.setText(contents);    //메일 내용을 입력

			// send the message

			Transport.send(message); // 전송

			return true;

		} catch (AddressException e) {
			e.printStackTrace();
			return false;

		} catch (MessagingException e) {
			e.printStackTrace();
			return false;

		}

	}

	public String getMemberEmail(String id, int no) {
		return memberRepository.getMemberEmail(id, no);
	}

	// json data를 파싱하여 email 전송
	public boolean sendEmail(String jsonData) {

		JSONObject jObject = new JSONObject(jsonData);

		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";

		for(int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			contents += obj.getString("insert");
		}

		String email = jObject.getString("email");
		String title = jObject.getString("title");

		// 메일 발송
		boolean result = gmailSend(email, title, contents);

		return result;
	}

	////////////////////////////////////////////////////////////////////////////////

	// member list 페이징
	public Map<String,Object> memberList(String id, int currentPage,String keyword,String option) {

		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset=(currentPage-1)*5;

		int total = memberRepository.listCount(id, option, keyword);

		List<MemberVo> list;
		if(option.equals("")) {
			list = memberRepository.memberList(id, offset, LIST_SIZE);
		}
		else {
			list = memberRepository.searchMemberList(id, option, keyword, offset, LIST_SIZE);
		}

		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 : (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;

		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;

		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;

		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("option", option);
		map.put("kwd",keyword);
		map.put("calCnt", calCnt);

		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);

		return map;

	}

	// board list 페이징
	public Map<String,Object> boardList(String id, int currentPage,String keyword,String option) {

		Map<String, Object> map = new HashMap<>();

		// start index 결정
		int offset=(currentPage-1)*5;

		int total = memberRepository.boardListCount(id, option, keyword);


		List<BoardVo> list;
		if(option.equals("")) {
			list = memberRepository.boardList(id, offset, LIST_SIZE);
		}
		else {
			list = memberRepository.searchBoaardList(id, option, keyword, offset, LIST_SIZE);
		}

		int pageCnt=(total%LIST_SIZE!=0) ? (total/LIST_SIZE)+1 : (total/LIST_SIZE);
		int calCnt=(currentPage%5)==0 ? currentPage-1 : currentPage;

		int beginPage=calCnt-(calCnt%5)==0 ? 1 : calCnt-(calCnt%5)+1;
		int prevPage = beginPage == 1 ? 1 : beginPage -1;
		int endPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : (beginPage+PAGE_SIZE)-1;
		int nextPage = (pageCnt-(pageCnt%5))==(calCnt-(calCnt%5)) ? pageCnt : endPage+1;

		if(nextPage>=pageCnt)
			nextPage=pageCnt;
		if(endPage>=pageCnt)
			endPage=pageCnt;

		map.put("list", list);
		map.put("beginPage",beginPage);
		map.put("prevPage",prevPage);
		map.put("endPage",endPage);
		map.put("nextPage",nextPage);
		map.put("page",currentPage);
		map.put("total",total);
		map.put("option", option);
		map.put("kwd",keyword);
		map.put("calCnt", calCnt);

		if(endPage!=pageCnt)
			map.put("listsize",LIST_SIZE);
		else
			map.put("listsize",endPage%5);

		return map;

	}

	public boolean deleteMember(String id, int no) {

		int count =  memberRepository.deleteMember(id, no);
		return count == 1;
	}

	public boolean deleteBoard(String id, int no) {
		int count = memberRepository.deleteBoard(id, no);
		return count == 1;
	}

	public boolean boardReply(String id, int no, String jsonData) {

		JSONObject jObject = new JSONObject(jsonData);

		JSONArray jArray = jObject.getJSONArray("ops");

		String contents = "";

		for(int i = 0; i < jArray.length(); i++) {
			JSONObject obj = jArray.getJSONObject(i);
			System.out.println("obj:"+obj);
			if(i == jArray.length() - 1) {
				contents += obj;
			}
			else {
				contents += obj + ",";
			}
		}

		int count = memberRepository.boardReply(id, no, contents);
		return count == 1;
	}

	public BoardVo findBoardByNo(String id, int no) {
		return memberRepository.findBoardByNo(id, no);
	}
	
	public ReplyVo findReplyByParentsNo(String id, int no) {

		return memberRepository.findReplyByParentsNo(id, no);
	}

	public boolean setBoardReplyTrue(String id, int no) {
		int count = memberRepository.setBoardReplyTrue(id, no);
		return count == 1;
	}

	public String findNameByNo(String id, int no) {
		return memberRepository.findNameByNo(id, no);
	}



}

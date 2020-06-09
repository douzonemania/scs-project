package com.douzonemania.shop.service;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.shop.repository.MemberRepository;
import com.douzonemania.shop.vo.MemberVo;

@Service
public class MemberService {

	final static String user = "sjy80333@gmail.com";
	final static String password = "vmjxszqyzgnugerp";
	
	@Autowired
	MemberRepository memberRepository;
	
	public boolean existUser(String id) {
		
		
		return memberRepository.existUser(id);
	}

	public void insertUser(@Valid MemberVo vo) {
		
		memberRepository.insertUser(vo);
		
	}

	public int findUser(@Valid MemberVo vo) {
		int result= memberRepository.findUser(vo);
		
		return result;
	}
	
	public String findIdByPhone(String phoneNum) {
		return memberRepository.findIdByPhone(phoneNum);
	}

public Boolean sendPasswordEmail(String id, String phone) {
		
		// 임시 비밀번호를 생성
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
				'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

		int idx = 0;
		StringBuffer sb = new StringBuffer();
		
		for(int i = 0; i < 8; i++) {
			idx = (int) (charSet.length * Math.random());
			sb.append(charSet[idx]);
		}
		String newPassword = sb.toString();		// 임시 비밀번호
		

		// 회원의 이메일로 임시 비밀번호 전송(email api)
		String title = "[scs] 임시 비밀번호";
		String contents = "[scs] \n 회원님의 임시 비밀번호는 [" + newPassword + "] 입니다. \n"
				+ "변경된 비밀번호로 다시 로그인해주세요. \n 비밀번호는 로그인한 뒤 다시 변경하실 수 있습니다.";
		
		String email = memberRepository.findEmailById(id);
		gmailSend(email, title, contents);
		
		// 회원의 비밀번호를 새 임시 비밀번호로 변경
		int count = memberRepository.updatePassword(id, newPassword);
		return count == 1;
	}

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

	public MemberVo findUserByNo(Long no) {
		return memberRepository.findUserByNo(no);
	}

	public int modPassword(String id, String newPassword) {
		return memberRepository.modPassword(id, newPassword);
	}

}

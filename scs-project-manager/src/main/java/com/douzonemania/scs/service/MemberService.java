package com.douzonemania.scs.service;

import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.douzonemania.scs.repository.MemberRepository;
import com.douzonemania.scs.vo.member.MemberVo;

@Service
public class MemberService {

	final static String user = "sjy80333@gmail.com";
	final static String password = "vmjxszqyzgnugerp";

	@Autowired
	private MemberRepository memberRepository;
	
	// 받는사람 이메일 주소와 메일 제목, 내용을 input에서 받아오기
	public boolean gmailSend() {

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
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("sjy8033@naver.com")); 
			
			System.out.println("메일 보내져라~!!!!!!!!");
			
			// Subject
			message.setSubject("test"); //메일 제목을 입력

			// Text
			message.setText("mail test~!");    //메일 내용을 입력

			// send the message
			
			Transport.send(message); // 전송
			
			System.out.println("메일 보내졌다!!!!!!!!!!!!!!!!!!");
			return true;
		} catch (AddressException e) {
			e.printStackTrace();
			return false;
		} catch (MessagingException e) {
			e.printStackTrace();
			return false;
		}

	}

	public List<MemberVo> memberList(String id) {
		return memberRepository.memberList(id);
	}

	public String getMemberEmail(String id, int no) {
		return memberRepository.getMemberEmail(id, no);
	}


}

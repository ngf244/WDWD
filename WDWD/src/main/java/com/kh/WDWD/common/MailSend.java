package com.kh.WDWD.common;


import javax.servlet.http.HttpServletRequest;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class MailSend {

	public int sendPIN(HttpServletRequest request, String email) {
		// 1. 전달받은 값 인코딩
				// - 전송할 값은 html이 아닌 다른 프로토콜로 전송할 것이기 때문에
				// 현재는 별도 인코딩을 하지 않습니다.
				try {
					request.setCharacterEncoding("UTF-8");
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				}

				final String sender = "daehokim777@naver.com"; // 보내는 사람 ID (Ex: @naver.com 까지..)
				final String password = "eoghslarj1!"; // 보내는 사람 Password
				
				String ranNum = createPINNum();
				String title = "WDWD 포인트샵 결제 PIN번호";
				
				String host = "smtp.naver.com"; // 사용하는 메일
				
				System.out.println("---------recv Data Check--------");
				System.out.println("recvID : " + email);
				System.out.println("title : " + title);
				System.out.println("content : " + ranNum);
				System.out.println("--------------------------");

				// Get the session object
				Properties props = new Properties();
				props.put("mail.smtp.host", host);
				props.put("mail.smtp.auth", "true");

				Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(sender, password);
					}
				});

				// Compose the message
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(sender));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));

					// sender Email Address
//					message.setFrom("테스트메일 : <" + sender + ">");
					message.setFrom(sender);

					// Subject
					message.setSubject(title);

					// Text
					message.setText(ranNum, "UTF-8", "html");

					// send the message
					Transport.send(message);
					System.out.println("전송 완료!!!!");
					return 1;

				} catch (MessagingException e) {
					System.out.println("전송 실패!! ㅠㅠ");
					e.printStackTrace();
					return 0;
				}
	}
	public String createPINNum() {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };
		
		int idx = 0; 
		StringBuffer sb = new StringBuffer(); 
//		System.out.println("charSet.length :::: "+charSet.length); 
		
		for (int i = 1; i <= 16; i++) { 
			idx = (int) (charSet.length * Math.random()); // 36 * 생성된 난수를 Int로 추출 (소숫점제거) 
//			System.out.println("idx :::: "+idx); 
			sb.append(charSet[idx]);
			
			// 4자리 수마다 - 삽입
			if(i % 4 == 0) {
				if(i == 16) {
					continue;
				}
				sb.append("-");
			}
			
		}
		return sb.toString(); 
	}
}

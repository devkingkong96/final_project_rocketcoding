package com.rocket.ksj.chat.model.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.rocket.jsy.employee.model.dto.Employee;
import com.rocket.ksj.chat.model.dao.LoginDao;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LoginService {
	
	private final LoginDao dao;
	private final SqlSession session;
	private final JavaMailSender mailsender;
	
	public List<Employee> selectEmployeeAll(){
		return dao.selectEmployeeAll(session);
	}
	
	public Employee selectEmployeeById(String empNo) {
		return dao.selectEmployeeById(session,empNo);
	}
	
	public Employee selectEmployeeByNoEmail(Map<String, String>map) {
		return dao.selectEmployeeByNoEmail(session,map);
	}
	
	public int updateEmployeeTempPwd(Map<String, String> emp) {
		return dao.updateEmployeeTempPwd(session,emp);
	}
	
	public void sendEmail(String email,String empNo,String tmpPwd) {
		log.info("이메일{}",email);
		log.info("이메일{}",empNo);
		log.info("이메일{}",tmpPwd);
		String subject="[RocketERP] 임시비밀번호 발급 안내";
		String msg="";
		msg+="<div align='center' style='border:1px solid black; font-family:verdana'>";
		msg+="<h3 style='color: blue;'><strong>"+empNo;
		msg+="사원님</strong>의 임시 비밀번호 입니다. 해당 번호로 로그인해주세요.";
		msg+="<p>임시 비밀번호 : <strong>"+tmpPwd+"</strong></p></dive>";
		MimeMessage message=mailsender.createMimeMessage();
		MimeMessageHelper helper=new MimeMessageHelper(message,"UTF-8");
		try {
			helper.setTo(email);
			helper.setSubject(subject);
			helper.setText(msg);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
//		SimpleMailMessage message=new SimpleMailMessage();
//		message.setTo(email);
//		message.setSubject(subject);
//		message.setText(msg);
		
		
		mailsender.send(message);
	}
	
	
	public String getTempPassword() {
		String tempPw=UUID.randomUUID().toString().replace("-", ""); // - 제거
		tempPw=tempPw.substring(0,10); //pw 10자리까지 자르기
		return tempPw;
	}
}

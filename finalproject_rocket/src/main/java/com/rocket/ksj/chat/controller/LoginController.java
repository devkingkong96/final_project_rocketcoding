package com.rocket.ksj.chat.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.jsy.employee.model.dto.Employee;
import com.rocket.ksj.chat.model.service.LoginService;
import com.rocket.ksj.chat.model.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class LoginController {
	
	private final LoginService service;
	private final BCryptPasswordEncoder encoder=new BCryptPasswordEncoder();
	
	//사원번호, 이메일이 있는지 확인하는 메소드
	@GetMapping("/member/emailCheck")
	@ResponseBody
	public String checkEmail(@RequestParam("empNo")String empNo,@RequestParam("email")String email) {
		log.info("check메소드 진입 성공");
		int CheckempNo=service.selectEmployeeByIdTmp(empNo);
		log.info("{}",empNo);
		log.info("{}",CheckempNo);
		if(CheckempNo<1) {
			log.info("EmptyNo 없음");
			return "EmptyNo";
			}
		Map<String, String>map=new HashMap<>();
		map.put("empNo", empNo);
		map.put("email", email);
		int CheckempEmail=service.selectEmployeeByNoEmailTmp(map);
		if(CheckempEmail<1) {
			log.info("EmptyEmail 성공");
			return "EmptyEmail";
			}
		
		log.info("emp");
		return "emp";
	}
	
	//임시 비밀번호 메일로 전송
	@ResponseBody
	@PostMapping("/member/sendPwd")
	public String sendPwdEmail(String empNo,String email) {
		log.info("sendpwd 성공");
		//Map에 담아 파라미터로 전달
		Map<String, String>emp=new HashMap<>();
		emp.put("empNo",empNo);
		
		//임시 비밀번호 생성
		String tmpPwd=service.getTempPassword();
		String BCtmpPwd=encoder.encode(tmpPwd);
		emp.put("tmpPwd",BCtmpPwd);
		
		//임시 비밀번호 DB에 저장
		if(service.updateEmployeeTempPwd(emp)<1) {
			return "DBfail";
		}
		
		//메일 생성 & 전송
		service.sendEmail(email,empNo,tmpPwd);
		
		log.info("임시 비밀번호 전송 완료");
		return "success";
	}
	
	
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	
	@RequestMapping("/chat")
	public String chat() {
		return "chat/chatting";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "loginpage";
	}
}
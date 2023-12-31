package com.rocket.ksj.chat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rocket.jsy.employee.model.dto.Employee;
import com.rocket.ksj.chat.model.service.ChatService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {

	private final ChatService service;
	
	
	@GetMapping("/list")
	public String chatlist(Model m,HttpSession session) {
		Employee emp=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//로그인한 회원 번호
		int empNo=emp.getEmpNo();
		//로그인한 회원 제외한 직원 리스트 가져오기
		List<Map<String, Object>>emplist=service.selectEmployeeAll(empNo);
		//로그인한 직원 채팅방 가져오기
		List<Map<String, Object>>chatlist=service.selectChatAll(empNo);
		//모든 대화방 가져오기
//		List<Map<String, Object>>chatroomlist=service.selectRoomAll();
		
		m.addAttribute("emplist",emplist);
		m.addAttribute("chatlist",chatlist);
		m.addAttribute("logempNo",empNo);
//		m.addAttribute("chatroomlist",chatroomlist);
		
		return "chat/chatlist";
	}
	
	
	
}

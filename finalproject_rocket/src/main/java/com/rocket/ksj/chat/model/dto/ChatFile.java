package com.rocket.ksj.chat.model.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@JsonIdentityInfo (
   generator = ObjectIdGenerators.IntSequenceGenerator.class)
public class ChatFile {
	
	private int fileNo;
	
	private ChatMessage messageId;
	
	private String originFileName;
	private String renamedFileName;
	
	private Date uploadAt;
}

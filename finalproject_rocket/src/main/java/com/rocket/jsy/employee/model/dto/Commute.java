package com.rocket.jsy.employee.model.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Commute {
	
	private int comNo;
	private Date comEnroll;
	private Date comEnd;
	
	private int empNo; //사원번호
}

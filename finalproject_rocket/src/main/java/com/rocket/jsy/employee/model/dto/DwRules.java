package com.rocket.jsy.employee.model.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DwRules {
	private int dwrulesCode;
	private Date dwrulesStart;
	private Date dwrulesEnd;
	private Date dwrulesEarly;
	
	private Employee empNo;
}

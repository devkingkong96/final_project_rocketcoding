package com.rocket.pdw.aprv.model.dto;

import java.sql.Date;

import com.rocket.jsy.employee.model.dto.Employee;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Approval {
    private long aprvNo;
    private int aprvSq;
    private int aprvLv;
    private String aprvRe;
    private Document docNo;
    private Date aprvDate;
    private Employee empNo;
}
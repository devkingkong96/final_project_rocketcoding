package com.rocket.seoj.logistics.model.dto;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Brief description of functions
 *
 * @author J
 * @version 2023-12-23
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PrdInventory {

    private long prdIvId;
    private int prdIvQuantity;
    private String prdIvMemo;

    private Long prdId;

    private Long ivId;
}

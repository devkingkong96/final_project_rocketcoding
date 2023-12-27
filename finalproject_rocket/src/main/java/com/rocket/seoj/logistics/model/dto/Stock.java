package com.rocket.seoj.logistics.model.dto;

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
public class Stock {
    private long stkId;
    private int stkStock;
    private Branch branchId;
    private Product prdId;
}

//package com.rocket.seoj.logistics.controller;
//
//import com.rocket.common.Getrequest;
//import com.rocket.seoj.logistics.model.service.StockService;
//import jakarta.servlet.http.HttpServletRequest;
//import lombok.RequiredArgsConstructor;
//import lombok.extern.slf4j.Slf4j;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.Reader;
//import java.lang.reflect.Field;
//import java.sql.Clob;
//import java.sql.SQLException;
//import java.util.*;
//
///**
// * Brief description of functions
// *
// * @author J
// * @version 2024-01-12
// */
//@Controller
//@RequestMapping("/logistics")
//@RequiredArgsConstructor
//@Slf4j
//public class some {
//
//    private final StockService service;
//    private Map<String, String> tableIdColumnMap = new HashMap<String, String>() {
//
//        {
//            put("EMPLOYEE", "EMP_NO");
//            put("INVENTORY", "IV_ID");
//            put("BRANCH", "BRANCH_ID");
//            put("STOCK", "STK_ID");
//            put("PUBLISHER", "PUB_ID");
//            put("PRODUCT", "PRD_ID");
//            put("PRD_ATTACH", "PRD_FILE_ID");
//            put("PRDINVENTORY", "PRD_IV_ID");
//            put("INVENTORY_ATTACH", "IV_FILE_ID");
//            put("TAG", "DOC_TAG");
//            put("DOCUMENT", "DOC_NO");
//            put("APPROVAL", "APRV_NO");
//            put("APPROVAL_FILE", "APRVFILE_NO");
//        }
//    };
//
//    @RequestMapping("stock/branchbyheigt")
//    public String selectStockByProduct(HttpServletRequest request, Model model) {
//        HashMap<String, Object> params = Getrequest.getParameterMap(request);
//
//
//        Map<String, String[]> paramMap = request.getParameterMap();
//
//// branchId와 prdId 파라미터를 배열로 추출
//        String[] branchIdArray = paramMap.get("branchId");
//        String[] prdIdArray = paramMap.get("prdId");
//
//// 배열을 List로 변환
//        List<String> branchIdList = branchIdArray != null ? Arrays.asList(branchIdArray) : new ArrayList<>();
//        List<String> prdIdList = prdIdArray != null ? Arrays.asList(prdIdArray) : new ArrayList<>();
//
//        if (branchIdList == null || branchIdList.isEmpty()) {
//            branchIdList = new ArrayList<>();
//            branchIdList.add("0"); // '0'을 기본값으로 사용
//        }
//        if (prdIdList == null || prdIdList.isEmpty()) {
//            prdIdList = new ArrayList<>();
//            prdIdList.add("0"); // '0'을 기본값으로 사용
//        }
//
//        params.put("branchIdList", branchIdList);
//        params.put("prdIdList", prdIdList);
//
//        List<Map<String, Object>> daybyStockList = service.selectStockByProduct(params);
//
//        List<Map<String, Object>> uniqueList = new ArrayList<>();
//
//        Set<Object> prdIdSet = new HashSet<>();
//        for (Map<String, Object> map : daybyStockList) {
//            Object popPrdId = map.get("PRD_ID");
//            /*            log.error("{}", popPrdId);*/
//            if (!prdIdSet.contains(popPrdId)) {
//                prdIdSet.add(popPrdId);
//                uniqueList.add(map);
//            }
//        }
//
//        List<Map<String, Object>> branchNameUniqueList = new ArrayList<>();
//
//        Set<Object> brcNameSet = new HashSet<>();
//        for (Map<String, Object> map : daybyStockList) {
//            Object popBrcName = map.get("BRANCH_NAME");
//            if (!brcNameSet.contains(popBrcName)) {
//
//                brcNameSet.add(popBrcName);
//                log.error("popBrcName : {}", popBrcName);
//                branchNameUniqueList.add(map);
//            }
//        }
//        model.addAttribute("branchNameUniqueList", branchNameUniqueList);
//        model.addAttribute("daybyStockList", daybyStockList);
//        return "logistics/heihtBranchByStockPage";
//    }
//
//    @RequestMapping("stock/branchby")
//    public String selectStockByBranch(HttpServletRequest request, Model model) {
//        HashMap<String, Object> params = Getrequest.getParameterMap(request);
//
//
//        Map<String, String[]> paramMap = request.getParameterMap();
//
//// branchId와 prdId 파라미터를 배열로 추출
//        String[] branchIdArray = paramMap.get("branchId");
//        String[] prdIdArray = paramMap.get("prdId");
//
//// 배열을 List로 변환
//        List<String> branchIdList = branchIdArray != null ? Arrays.asList(branchIdArray) : new ArrayList<>();
//        List<String> prdIdList = prdIdArray != null ? Arrays.asList(prdIdArray) : new ArrayList<>();
//
//        if (branchIdList == null || branchIdList.isEmpty()) {
//            branchIdList = new ArrayList<>();
//            branchIdList.add("0"); // '0'을 기본값으로 사용
//        }
//        if (prdIdList == null || prdIdList.isEmpty()) {
//            prdIdList = new ArrayList<>();
//            prdIdList.add("0"); // '0'을 기본값으로 사용
//        }
//
//        params.put("branchIdList", branchIdList);
//        params.put("prdIdList", prdIdList);
//
//        List<Map<String, Object>> daybyStockList = service.selectStockByBranch(params);
//
//        List<Map<String, Object>> uniqueList = new ArrayList<>();
//
//        Set<Object> prdIdSet = new HashSet<>();
//        for (Map<String, Object> map : daybyStockList) {
//            Object popPrdId = map.get("PRD_ID");
//            /*            log.error("{}", popPrdId);*/
//            if (!prdIdSet.contains(popPrdId)) {
//                prdIdSet.add(popPrdId);
//                uniqueList.add(map);
//            }
//        }
//
//        List<Map<String, Object>> branchNameUniqueList = new ArrayList<>();
//
//        Set<Object> brcNameSet = new HashSet<>();
//        for (Map<String, Object> map : daybyStockList) {
//            Object popBrcName = map.get("BRANCH_NAME");
//            if (!brcNameSet.contains(popBrcName)) {
//
//                brcNameSet.add(popBrcName);
//                log.error("popBrcName : {}", popBrcName);
//                branchNameUniqueList.add(map);
//            }
//        }
//        model.addAttribute("branchNameUniqueList", branchNameUniqueList);
//        model.addAttribute("daybyStockList", uniqueList);
//        return "logistics/widthBranchByStockPage";
//    }
//
//    @RequestMapping("stock/searchbybranch")
//    public String searchByBranch(Model model) {
//        List<Map<String, Object>> branchList = service.selectAllBranch();
//
//        List<Map<String, Object>> selectAllProduct = service.selectAllProduct();
//
//        model.addAttribute("branchList", branchList);
//        model.addAttribute("productList", selectAllProduct);
//        return "logistics/searchStockByBranch";
////        return "redirect:/logistics/searchDaybyStock";
//        /*        return "logistics/searchDaybyStock";*/
//    }
//
//    @RequestMapping("stock/dayby")
//    public String daybyStock(HttpServletRequest request, Model model) {
//        HashMap<String, Object> params = Getrequest.getParameterMap(request);
//
//
//// params의 모든 키-값 쌍을 반복하여 출력
//        for (Map.Entry<String, Object> entry : params.entrySet()) {
//            String key = entry.getKey();
//            Object value = entry.getValue();
//            log.error(key + ": " + value);
//        }
//
//        Map<String, String[]> paramMap = request.getParameterMap();
//
//// branchId와 prdId 파라미터를 배열로 추출
//        String[] branchIdArray = paramMap.get("branchId");
//        String[] prdIdArray = paramMap.get("prdId");
//
//// 배열을 List로 변환
//        List<String> branchIdList = branchIdArray != null ? Arrays.asList(branchIdArray) : new ArrayList<>();
//        List<String> prdIdList = prdIdArray != null ? Arrays.asList(prdIdArray) : new ArrayList<>();
//
//        if (branchIdList == null || branchIdList.isEmpty()) {
//            branchIdList = new ArrayList<>();
//            branchIdList.add("0"); // '0'을 기본값으로 사용
//        }
//        if (prdIdList == null || prdIdList.isEmpty()) {
//            prdIdList = new ArrayList<>();
//            prdIdList.add("0"); // '0'을 기본값으로 사용
//        }
//
//        params.put("branchIdList", branchIdList);
//        params.put("prdIdList", prdIdList);
//
//
//        /*        log.debug("{}", params);*/
//
//        List<Map<String, Object>> daybyStockList = service.selectDaybyStock(params);
//
///*        log.debug("{}", daybyStockList.size());
//
//        for (Map<String, Object> map : daybyStockList) {
//            for (Map.Entry<String, Object> entry : map.entrySet()) {
//                String key = entry.getKey();
//                Object value = entry.getValue();
//                log.debug(key + ": " + value);
//            }
//            log.debug("------------------------");
//        }*/
//        List<Map<String, Object>> uniqueList = new ArrayList<>();
//
//        Set<Object> prdIdSet = new HashSet<>();
//        for (Map<String, Object> map : daybyStockList) {
//            Object popPrdId = map.get("PRD_ID");
//            /*            log.error("{}", popPrdId);*/
//            if (!prdIdSet.contains(popPrdId)) {
//                prdIdSet.add(popPrdId);
//                uniqueList.add(map);
//            }
//        }
//
//        model.addAttribute("daybyStockList", uniqueList);
//        return "logistics/daybyStockPage";
//    }
//
//    @RequestMapping("stock/searchbyday")
//    public String searchDaybyStock(Model model) {
//        List<Map<String, Object>> branchList = service.selectAllBranch();
//
//        List<Map<String, Object>> selectAllProduct = service.selectAllProduct();
//
//        model.addAttribute("branchList", branchList);
//        model.addAttribute("productList", selectAllProduct);
//        return "logistics/searchStockbyDay";
////        return "redirect:/logistics/searchDaybyStock";
//        /*        return "logistics/searchDaybyStock";*/
//    }
//
//    public void printFieldNames(Object obj) {
//        Class<?> objClass = obj.getClass();
//        Field[] fields = objClass.getDeclaredFields();
//
//        log.debug("Field names of class " + objClass.getName() + ":");
//        for (Field field : fields) {
//            log.debug(field.getName());
//        }
//    }
//
//    public String clobToString(Clob data) {
//        StringBuilder sb = new StringBuilder();
//
//        try {
//            Reader reader = data.getCharacterStream();
//            BufferedReader br = new BufferedReader(reader);
//
//            String line;
//
//            while (null != (line = br.readLine())) {
//                sb.append(line);
//            }
//            br.close();
//        } catch (SQLException | IOException e) {
//
//        }
//        return sb.toString();
//    }
//}

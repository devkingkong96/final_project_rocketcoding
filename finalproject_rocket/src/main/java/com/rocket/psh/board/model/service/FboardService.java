package com.rocket.psh.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.rocket.psh.board.model.dto.Fboard;

public interface FboardService {
   
   List<Map<String, Object>> selectFboardList(Map<String, Object> map); 
   
   int insertFboard(Fboard fboard);

   int increaseViewCount(int fboardNo);
   
   Map<String, Object> selectFboardDetail(int fboardNo);

   List<Map<String, Object>> selectFboardComments(int fboardNo);
   
   int updateFboard(Map<String, Object> map);

   int deleteFboard(int fboardNo);
   
   
   
}

package com.rocket.psh.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class FboardCommentDaolmpl implements FboardCommentDao {
		
	    @Override
		public HashMap<String, Object> selectCommentByCommentNo(SqlSession sesion, int commentNo) {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public List<HashMap<String, Object>> selectCommentsByFboardNo(SqlSession sesion, int fboardNo) {
			// TODO Auto-generated method stub
			return null;
		}
	
		@Override
		public int updateComment(SqlSession sesion, Map<String, Object> commentData) {
			// TODO Auto-generated method stub
			return 0;
		}
	
		@Override
		public int deleteComment(SqlSession session, Map<String, Object> commentData) {
			return session.delete("fboardcomment.deleteComment",commentData);
		}
	
		@Override
		public int insertComment(SqlSession sesion, Map<String, Object> reqAll) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int deleteComment(SqlSession sesion, int commentNo) {
			// TODO Auto-generated method stub
			return 0;
		}
		
//
//		// 댓글 조회
//	    public HashMap<String, Object> selectCommentByCommentNo(int commentNo) {
//	        try (SqlSession session = sqlSessionFactory.openSession()) {
//	            return session.selectOne("selectCommentByCommentNo", commentNo);
//	        }
//	    }
//	
//	    // 게시글에 대한 모든 댓글 조회
//	    public List<HashMap<String, Object>> selectCommentsByFboardNo(int fboardNo) {
//	        try (SqlSession session = sqlSessionFactory.openSession()) {
//	            return session.selectList("fboardcomment.selectCommentsByFboardNo", fboardNo);
//	        }
//	    }
//	
	    // 댓글 추가
		/*
		 * public int insertComment(HashMap<String, Object> commentData) { try
		 * (SqlSession session = sqlSessionFactory.openSession()) { int result =
		 * session.insert("insertComment", commentData); session.commit(); return
		 * result; } }
		 */
	    //댓글 추가 
//	    public int (Map param) {
//	        return commentMapper.insertComment(param);
//	    }
	    

		/*
		 * public int insertComment(Map<String, Object> reqAll) { try (SqlSession
		 * session = sqlSessionFactory.openSession()) { return
		 * session.insert("fboardcomment.insertComment", reqAll); } }
		 * 
		 * // 댓글 수정 public int updateComment(Map<String, Object> commentData) { try
		 * (SqlSession session = sqlSessionFactory.openSession()) { int result =
		 * session.update("fboardcomment.updateComment", commentData); session.commit();
		 * return result; } }
		 * 
		 * // 댓글 삭제여부 업데이트 (실제 삭제는 하지 않음) public int deleteComment(int commentNo) { try
		 * (SqlSession session = sqlSessionFactory.openSession()) { HashMap<String,
		 * Object> params = new HashMap<>(); params.put("commentNo", commentNo);
		 * params.put("FBD_COMMENT_YN", "Y"); int result =
		 * session.update("fboardcomment.deleteComment", params); session.commit();
		 * return result; } }
		 * 
		 * @Override //일단 이거 인트로 받을껀지 맵으로 받을껀지 고민좀 해봐야함 public int
		 * deleteComment(Map<String, Object> commentData) { // TODO Auto-generated
		 * method stub return 0; }
		 */

		
}


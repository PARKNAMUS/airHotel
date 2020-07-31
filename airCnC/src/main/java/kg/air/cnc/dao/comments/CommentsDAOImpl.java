package kg.air.cnc.dao.comments;

import java.util.List;

import kg.air.cnc.vo.CommentsVO;

public interface CommentsDAOImpl {
	
	public void insertComments(CommentsVO vo);
	public void deleteComments(CommentsVO vo);
	public List<CommentsVO> getComments(CommentsVO vo);
	public void updateComments(CommentsVO vo);
	
}

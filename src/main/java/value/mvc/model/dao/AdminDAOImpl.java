package value.mvc.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProcessDTO;
import value.mvc.model.dto.QuestionDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	@Autowired
	private SqlSession session;
	
	@Override
	public List<ProcessDTO> selectProductByProcess(String processState) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QuestionDTO> selectQuestionByState(String QuestionNo, boolean state) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertNotice(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(String noticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}

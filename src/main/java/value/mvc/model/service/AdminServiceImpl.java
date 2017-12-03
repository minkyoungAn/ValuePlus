package value.mvc.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import value.mvc.model.dao.AdminDAO;
import value.mvc.model.dto.NoticeDTO;
import value.mvc.model.dto.ProcessDTO;
import value.mvc.model.dto.QuestionDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDao;
	
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
